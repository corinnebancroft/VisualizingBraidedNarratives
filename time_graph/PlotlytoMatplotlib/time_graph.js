/* This file is designed to add interactivity to the time graph. */

'use strict';

let graphComponents = [];
let switching = false;
let tellingTimeCheck = null;

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
                if (checkNarr && checkNarr.checked){
                    gc.style.display = display;
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
    }
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

function setupControls(){
    console.log('Setting up...');
    let checks = document.querySelectorAll('input[data-id]');
    console.log(`Found ${checks.length} individual checkboxes.`);
    for (let i = 0; i < checks.length; i++){
        checks[i].addEventListener('change', function(){showHideGraphElements(this);}.bind(checks[i]));
    }
    graphComponents = document.querySelectorAll('g[id]');
    console.log(`Found ${graphComponents.length} individual g elements.`);
    let groupChecks = document.querySelectorAll('input.group');

    for (let i = 0; i < groupChecks.length; i++){
        groupChecks[i].addEventListener('change', function(){showHideAllGraphElements(this);}.bind(groupChecks[i]));
    }
    console.log(`Found ${groupChecks.length} group checkboxes.`);
    tellingTimeCheck = document.querySelector('input[data-id="tellline"]');
}   

window.addEventListener('load', function(){setupControls();});