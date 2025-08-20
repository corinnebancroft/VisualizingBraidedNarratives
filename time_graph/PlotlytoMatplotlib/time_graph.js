/* This file is designed to add interactivity to the time graph. */

'use strict';

let graphComponents = [];

function showHideGraphElements(sender){
    console.log('Click from ' + sender.getAttribute('data-id'));
    console.log('Sender checked? ' + sender.checked);
    let display = sender.checked ? '' : 'none';
    let re = new RegExp(sender.getAttribute('data-regex'));
    for (let i=0; i < graphComponents.length; i++){
        if (graphComponents[i].id.match(re)){
            graphComponents[i].style.display = display;
        }
    }
}

function setupControls(){
    console.log('Setting up...');
    let checks = document.querySelectorAll('input[data-id]');
    console.log(`Found ${checks.length} checkboxes.`);
    for (let i = 0; i < checks.length; i++){
        checks[i].addEventListener('change', function(){showHideGraphElements(this);}.bind(checks[i]));
    }
    graphComponents = document.querySelectorAll('g[id]');
    console.log(`Found ${graphComponents.length} g elements.`);
}

window.addEventListener('load', function(){setupControls();});