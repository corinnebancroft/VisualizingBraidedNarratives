/* This file is designed to add interactivity to the time graph. */

'use strict';

let graphComponents = [];
let switching = false;
let tellingTimeCheck = null;
let dlgEvents = null;
let dlgTellTime = null;
let selectedGraphElement = null;

// Figure out color of an element for pop-up window
function getGraphElementColor(el) {
    if (!el) return '#000';

    // --------------------------------------------------
    // 1) Direct shapes (lines etc.)
    // --------------------------------------------------
    let target =
        el.matches('path, line, circle, rect, use')
            ? el
            : el.querySelector('path, line, circle, rect, use');

    if (target) {
        // ✅ FIRST: try inline style (essential for Matplotlib markers)
        const style = target.getAttribute('style');
        if (style) {
            const fillMatch = style.match(/fill:\s*(#[0-9a-fA-F]{6})/);
            if (fillMatch) return fillMatch[1];

            const strokeMatch = style.match(/stroke:\s*(#[0-9a-fA-F]{6})/);
            if (strokeMatch) return strokeMatch[1];
        }

        // ✅ FALLBACK: computed styles (works for lines)
        const cs = getComputedStyle(target);
        if (cs.stroke && cs.stroke !== 'none') return cs.stroke;
        if (cs.fill && cs.fill !== 'none') return cs.fill;
    }

    // --------------------------------------------------
    // 2) Walk up ancestors (rare fallback)
    // --------------------------------------------------
    let node = el.parentElement;
    while (node && node.tagName !== 'svg') {
        if (node.nodeType === 1) {
            const style = node.getAttribute('style');
            if (style) {
                const fillMatch = style.match(/fill:\s*(#[0-9a-fA-F]{6})/);
                if (fillMatch) return fillMatch[1];

                const strokeMatch = style.match(/stroke:\s*(#[0-9a-fA-F]{6})/);
                if (strokeMatch) return strokeMatch[1];
            }
        }
        node = node.parentElement;
    }

    // --------------------------------------------------
    // 3) Fallback
    // --------------------------------------------------
    return '#000';
}


function syncTellingTimeChild() {
    const parent = document.querySelector('input[data-id="tellline"]');
    const child  = document.querySelector('input[data-id="tellline2"]');
    if (!parent || !child) return;

    if (!parent.checked) {
        // Parent OFF → child looks off and is disabled
        child.checked = false;
        child.disabled = true;
    } else {
        // Parent ON → child regains control
        child.disabled = false;
    }
}

function showHideGraphElements(sender){
    console.log('Click from ' + sender.getAttribute('data-id'));
    console.log('Sender checked? ' + sender.checked);
    let display = sender.checked ? '' : 'none';
    let strRe = sender.getAttribute('data-regex');
    let re = new RegExp(strRe);
    //If sender is the telling time control, we need to work carefully.
    if ((sender.getAttribute('data-id') == 'tellline') && (sender.checked)){
        for (let i=0; i < graphComponents.length; i++){
            let gc = graphComponents[i];
            if (gc.id.match(re)){
                let narr = gc.getAttribute('id').replace(/^tellline_\d+_(.+)_\d+$/, '$1');
                //console.log(narr);
                let checkNarr = document.querySelector('input[data-id="' + 'narr_' + narr + '"]');
                const senderId = sender.getAttribute('data-id');

if (
    checkNarr &&
    checkNarr.checked &&
    (
        senderId === ('narr_' + narr) ||
        senderId === 'tellline' ||
        senderId === 'tellline2'
    )
){
                    const isGuideline = /^tellline_2/.test(gc.id);
                    const childCheck = document.querySelector('input[data-id="tellline2"]');
                    const showThis = !isGuideline || (childCheck && childCheck.checked);
                    gc.style.display = showThis ? display : 'none';
                }
            }
        }
    }
    else{
        for (let i=0; i < graphComponents.length; i++){
            if (graphComponents[i].id.match(re)){
                graphComponents[i].style.display = display;
            }
        }
    }

    //Now we may need to do something with telling time lines.
    if (strRe.match('^narr')){
        let tellingLinesDisplay = (sender.checked && tellingTimeCheck.checked)? '' : 'none';
        let strTellingRe = sender.getAttribute('data-telling-regex');
        let tellingRe = new RegExp(strTellingRe);
        for (let i=0; i < graphComponents.length; i++){
            if (graphComponents[i].id.match(tellingRe)){
                graphComponents[i].style.display = tellingLinesDisplay;
            }
        }

        // ALSO hide/show line graph guidelines for this narrator
        let strGuidelinesRe = sender.getAttribute('data-guidelines-regex');
        if (strGuidelinesRe) {
        let guidelinesRe = new RegExp(strGuidelinesRe);

        for (let i = 0; i < graphComponents.length; i++) {
            if (graphComponents[i].id.match(guidelinesRe)) {
            graphComponents[i].style.display = tellingLinesDisplay;
            }
        }
}
    }
    syncTellingTimeChild();
    if (!switching){
        alignCheckboxes(sender.closest('div.legend').querySelector('input.group'));
    }
}

function showHideAllGraphElements(sender){
    if (switching){return;}
    try{
        switching = true;
        let subs = sender.closest('div.legend').querySelectorAll('ul>li input');
        console.log(`Found ${subs.length} sub-checkboxes.`);
        for (let i = 0; i< subs.length; i++){
            subs[i].checked = sender.checked;
            showHideGraphElements(subs[i]);
        }
    }
    catch(error){
        console.log('Error: ' + error);
    }
    finally{
        switching = false;
    }
}

function alignCheckboxes(groupCheckbox){
    if (switching || !groupCheckbox){return;}
    try{
        switching = true;
        let subs = groupCheckbox.parentNode.parentNode.querySelectorAll('ul>li input');
        if (subs.length > 0){
            let state = subs[0].checked;
            for (let i = 1; i< subs.length; i++){
                if (subs[i].checked !== state){
                    groupCheckbox.indeterminate = true;
                    return;
                }
            }
            groupCheckbox.checked = state;
            groupCheckbox.indeterminate = false;
        }
    }
    catch(error){
        console.log('Error: ' + error);
    }
    finally{
        switching = false;
    }
}

function showEvent(sender){
    closeAllPopups();
    let numEvent = sender.id.split('_')[1];
    let eventInfo = document.getElementById('event_' + numEvent);

    if (eventInfo){
        setSelectedGraphElement(sender);
        showPopup(dlgEvents, eventInfo.innerHTML, window.event);
    }
}

function showTellTime(sender){
    closeAllPopups();
    const m = sender.id.match(/^tellline_\d+_(.+)_(\d+)$/);
    if (!m){
        console.warn('Unexpected tellline id format:', sender.id);
        return;
    }

    const narrId = m[1];
    const rowKey = m[2];
    const ttInfo = document.getElementById('telltime_' + narrId + '_' + rowKey);

    if (!dlgTellTime){
        console.warn('dlgTellTime not found in DOM.');
        return;
    }

    if (ttInfo){
        setSelectedGraphElement(sender);
        showPopup(dlgTellTime, ttInfo.innerHTML, window.event);
    } else {
        console.warn('No TT content for narrator/key:', narrId, rowKey);
    }
}

function setupControls(){
    console.log('Setting up...');
    let checks = document.querySelectorAll('input[data-id]');
    console.log(`Found ${checks.length} individual checkboxes.`);
    for (let i = 0; i < checks.length; i++){
        checks[i].addEventListener('change', function(){showHideGraphElements(this);}.bind(checks[i]));
    }
    graphComponents = document.querySelectorAll('g[id]');
    console.log(`Found ${graphComponents.length} individual g elements.`);
    for (let i = 0; i < graphComponents.length; i++){
        if (graphComponents[i].id.match(/^(narrmark|charline|char)_/)){
            graphComponents[i].addEventListener('click', function(){showEvent(this);}.bind(graphComponents[i]));
        }
    syncTellingTimeChild(); // initialize child disabled/checked state on load
    }

    // Attach a separate pop-up for telling-time lines.
    for (let i = 0; i < graphComponents.length; i++){
        if (/^tellline_/.test(graphComponents[i].id)){
        graphComponents[i].addEventListener('click', function(){
            showTellTime(this);
        }.bind(graphComponents[i]));
        }
    }

    dlgEvents = document.querySelector('#dlgEvents');
dlgTellTime = document.querySelector('#dlgTellTime');

dlgEvents.style.display = 'none';
dlgTellTime.style.display = 'none';

    let groupChecks = document.querySelectorAll('input.group');

    for (let i = 0; i < groupChecks.length; i++){
        groupChecks[i].addEventListener('change', function(){showHideAllGraphElements(this);}.bind(groupChecks[i]));
    }
    console.log(`Found ${groupChecks.length} group checkboxes.`);
    tellingTimeCheck = document.querySelector('input[data-id="tellline"]');
}

function showPopup(el, html, evt){
    el.innerHTML = html;
    addCloseButton(el);

    if (evt){
        el.style.left = evt.pageX + 12 + 'px';
        el.style.top  = evt.pageY + 12 + 'px';
    }

    el.style.display = 'block';
}

function setSelectedGraphElement(el){
    if (selectedGraphElement){
        selectedGraphElement.classList.remove('selected-point');
    }

    selectedGraphElement = el;

    if (selectedGraphElement){
        selectedGraphElement.classList.add('selected-point');

        // set accent color globally
        const color = getGraphElementColor(el);
        document.documentElement.style.setProperty('--accent-color', color);
    }
}

function addCloseButton(popup){
    if (popup.querySelector('.popup-close')) return;

    const btn = document.createElement('button');
    btn.className = 'popup-close';
    btn.innerHTML = '×';
    btn.addEventListener('click', () => {
    popup.style.display = 'none';
    setSelectedGraphElement(null);
    });

    popup.prepend(btn);
}

function closeAllPopups(){
    if (dlgEvents) dlgEvents.style.display = 'none';
    if (dlgTellTime) dlgTellTime.style.display = 'none';
    setSelectedGraphElement(null);
}

// --- Zoom & pan (viewBox-based) ---
function setupZoomPan(){
    const figure  = document.querySelector('section.figure');
    if (!figure) return;

    const svg     = figure.querySelector('.graph svg');
    const toolbar = figure.querySelector('.toolbar');
    if (!svg) return;

    svg.setAttribute('tabindex','0'); // allow focus/keyboard later

    // Allow pointer panning without browser gestures interfering
    svg.style.touchAction = 'none';

    svg.addEventListener('click', (e) => {
    // If click was inside a popup, do nothing
    if (e.target.closest('#dlgEvents, #dlgTellTime')) return;

    // If click was on an interactive graph element, do nothing
    if (isInteractiveTarget(e.target)) return;

    // Otherwise, close popups
    closeAllPopups();
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeAllPopups();
});

    // -- Helpers ------------------------------------------------------------
    function parseViewBox(el){
        const vbAttr = el.getAttribute('viewBox');
        if (vbAttr){
            const [x, y, w, h] = vbAttr.trim().split(/[\s,]+/).map(Number);
            return { x, y, w, h };
        }
        // Fallback if no viewBox present
        const w = parseFloat(el.getAttribute('width'))  || el.getBoundingClientRect().width  || 100;
        const h = parseFloat(el.getAttribute('height')) || el.getBoundingClientRect().height || 100;
        return { x: 0, y: 0, w, h };
    }

    function setViewBox(vb){
        svg.setAttribute('viewBox', `${vb.x} ${vb.y} ${vb.w} ${vb.h}`);
    }

    function clientToSvg(clientX, clientY, vb){
        const r = svg.getBoundingClientRect();
        const sx = vb.x + (clientX - r.left) / r.width  * vb.w;
        const sy = vb.y + (clientY - r.top)  / r.height * vb.h;
        return { sx, sy, rect: r };
    }

    function zoomAt(factor, cx, cy){
  // factor < 1 → zoom in; factor > 1 → zoom out
  const { x, y, w, h } = vb;
  const { sx, sy } = clientToSvg(cx, cy, vb);

  // Compute the unconstrained new size
  const rawW = w * factor;
  const rawH = h * factor;

  // Clamp so we never go "smaller than 100%" (i.e., never exceed original size)
  // Keep aspect ratio by reducing the factor uniformly on both dimensions.
  const maxFactorW = vbOriginal.w / w; // maximum allowed zoom-out scale for width
  const maxFactorH = vbOriginal.h / h; // maximum allowed zoom-out scale for height
  const allowedFactor = (factor > 1)
    ? Math.min(factor, maxFactorW, maxFactorH)
    : factor;

  const nw = w * allowedFactor;
  const nh = h * allowedFactor;

  // Keep the cursor's data point stationary during zoom
  vb.x = sx - (sx - x) * (nw / w);
  vb.y = sy - (sy - y) * (nh / h);
  vb.w = nw;
  vb.h = nh;

  setViewBox(vb);
  updateButtons();

  // ✅ If we've zoomed all the way out, recenter to original viewBox
if (Math.abs(vb.w - vbOriginal.w) < 1e-6) {
  vb.x = vbOriginal.x;
  vb.y = vbOriginal.y;
  vb.w = vbOriginal.w;
  vb.h = vbOriginal.h;
  setViewBox(vb);
}
}

    function isInteractiveTarget(node){
    // Do NOT pan if press starts on interactive plot elements
    return !!(node && node.closest('g[id^="narr_"], g[id^="narrmark_"], g[id^="charline_"], g[id^="char_"], g[id^="tellline_"]'));
    }
    const MOVE_THRESHOLD = 6; // px; treat smaller movement as a click, not a pan


    // -- State --------------------------------------------------------------
    const vbOriginal = parseViewBox(svg);
    const vb = { ...vbOriginal };    // mutable working copy
    setViewBox(vb);                   // ensure viewBox is present/normalized

// ---- Zoom limits (1 = 100%) ---------------------------------------------
const MIN_ZOOM  = 1;     // cap zoom-out at 100%
const ZOOM_STEP = 1.1;   // your existing step

// Convenience: buttons may be null if toolbar missing
const btnIn    = toolbar?.querySelector('button.zoom-in')  || null;
const btnOut   = toolbar?.querySelector('button.zoom-out') || null;
const btnReset = toolbar?.querySelector('button.reset')    || null;

// Current zoom factor (derived from viewBox width)
function currentZoom() {
  return vbOriginal.w / vb.w;   // 1.0 when vb == vbOriginal
}

function updateButtons() {
  if (btnOut) btnOut.disabled = currentZoom() <= MIN_ZOOM + 1e-9;
  // If you ever add a MAX_ZOOM, you can also disable btnIn here.
}

    // -- Buttons ------------------------------------------------------------

  // -- Buttons ------------------------------------------------------------
if (toolbar) {
  if (btnIn){
    btnIn.addEventListener('click', () => {
      const r = svg.getBoundingClientRect();
      zoomAt(1/ZOOM_STEP, r.left + r.width/2, r.top + r.height/2);
    });
  }
  if (btnOut){
    btnOut.addEventListener('click', () => {
      const r = svg.getBoundingClientRect();
      zoomAt(ZOOM_STEP, r.left + r.width/2, r.top + r.height/2);
    });
  }
  if (btnReset){
    btnReset.addEventListener('click', () => {
      Object.assign(vb, vbOriginal);
      setViewBox(vb);
      updateButtons();
    });
  }
  // Initialize disabled state on load
  updateButtons();
}

    // -- Wheel zoom (around cursor) ----------------------------------------
    svg.addEventListener('wheel', (e) => {
        // Prevent page scroll when interacting with the plot
        e.preventDefault();
        // Natural feel: wheel up = zoom in; wheel down = zoom out
        const factor = (e.deltaY < 0) ? (1/1.2) : 1.2;
        zoomAt(factor, e.clientX, e.clientY);
    }, { passive: false });

    // -- Drag pan (always on, but not on interactive targets) ---------------
let isPanning = false;
let last = { cx: 0, cy: 0 };
let movedDuringPan = false;

svg.addEventListener('pointerdown', (e) => {
    // Only pan on primary button and if press is NOT on an interactive plot element
    const startOnInteractive = isInteractiveTarget(e.target);
    isPanning = (e.button === 0) && !startOnInteractive;
    movedDuringPan = false;
    last.cx = e.clientX;
    last.cy = e.clientY;

    if (isPanning) {
        svg.setPointerCapture(e.pointerId);
        // Prevent text selection / image drag while panning
        e.preventDefault();
    }
});

svg.addEventListener('pointermove', (e) => {
    if (!isPanning) return;
    const dx = e.clientX - last.cx;
    const dy = e.clientY - last.cy;

    // Convert pixel delta to SVG units using current viewBox
    const r = svg.getBoundingClientRect();
    vb.x -= dx / r.width  * vb.w;
    vb.y -= dy / r.height * vb.h;
    setViewBox(vb);

    last.cx = e.clientX;
    last.cy = e.clientY;

    // Flag as a real pan only after a noticeable move
    if (!movedDuringPan && (Math.abs(dx) + Math.abs(dy) >= MOVE_THRESHOLD)) {
        movedDuringPan = true;
    }
});

function endPan(e){
    if (!isPanning) return;
    isPanning = false;
    // No click suppression: interactive elements should receive clicks normally.
}
svg.addEventListener('pointerup', endPan);
svg.addEventListener('pointercancel', endPan);


    // -- Optional: double-click to reset (nice to have)
    svg.addEventListener('dblclick', () => {
        Object.assign(vb, vbOriginal);
        setViewBox(vb);
    });
}

window.addEventListener('load', function () {
  setupControls();
  setupZoomPan();
  syncLegendHeightToSvg();
});

window.addEventListener('resize', syncLegendHeightToSvg);

function syncLegendHeightToSvg() {
  const figure = document.querySelector('section.figure');
  if (!figure) return;

  const svg = figure.querySelector('.graph svg');
  const legends = figure.querySelector('.legend-form .legends');

  if (!svg || !legends) return;

  // Measure *rendered* SVG height (after layout)
  const svgRect = svg.getBoundingClientRect();
  if (!svgRect.height) return;

  // Apply height to legend stack
  legends.style.maxHeight = `${svgRect.height}px`;
}