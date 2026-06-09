//IIFE for UX code pux.js to avoid global namespace problems
(function() {
	// Function to update aria-expanded based on viewport width
	function updateAriaExpanded() {
		const navigation = document.getElementById('site-navigation');
		const hamburgerNav = document.getElementById('hamburger-nav');

		if (hamburgerNav && hamburgerNav.getAttribute('aria-expanded') === 'true') {
			navigation.setAttribute('aria-expanded', 'true');
		} else {
			navigation.setAttribute('aria-expanded', window.innerWidth >= 768 ? 'true' : 'false');
		}
	}
//aaragh
	// Function to toggle a specified attribute between two values
	function toggleAttribute(selector, attribute, value1, value2) {
		// Select the element
		const elem = document.querySelector(selector);

		// Get the current value of the attribute
		const currentValue = elem.getAttribute(attribute);

		// Set the attribute to the opposite value
		elem.setAttribute(attribute, currentValue === value1 ? value2 : value1);
	}

	// Function to toggle the attributes of the navigation elements when clicked
	function attributeToggler(e) {
		// Toggle data-state attribute between "closed" and "open"
		toggleAttribute("#mobile-nav-banner", "data-state", "closed", "open");
		toggleAttribute("#site-header", "data-state", "closed", "open");

		// Toggle aria-expanded attribute between "false" and "true"
		toggleAttribute("#hamburger-nav", "aria-expanded", "false", "true");

		// Add site-navigation element to toggle data-state and aria-expanded attributes
		toggleAttribute("#site-navigation", "aria-expanded", "false", "true");

		// Prevent default action of the click event
		e.preventDefault();
	}

	// Function to add event listeners to all navigation toggle elements
	function handleTogglers() {
		// Select all elements with class ".mobile-nav-toggle"
		const togglers = document.querySelectorAll(".mobile-nav-toggle");

		// Attach a click event listener to each toggle element
		function clickHandler(e) {
			attributeToggler(e);
		}

		togglers.forEach(function(toggler) {
			toggler.addEventListener("click", clickHandler);
		});
	}

	function addScrollButton() {
	  // Select the first h2 element
	  const h2Element = document.querySelector('h2');
	
	  // Select the scroll-to-top link
	  const scrollToTopLink = document.querySelector('.scroll-to-top');
	
	  // Set aria-hidden to true on page load
	  scrollToTopLink.setAttribute('aria-hidden', 'true');
	
	  // Define options for the Intersection Observer
	  const options = {
		threshold: 0.25 // Adjust the threshold value as needed
	  };
	
	  // Define the callback function
	  function callback(entries, observer) {
		entries.forEach(function(entry) {
		  if (entry.target === h2Element && entry.isIntersecting) {
			// First h2 element is visible, hide the scroll-to-top link
			scrollToTopLink.style.opacity = '0';
			scrollToTopLink.setAttribute('aria-hidden', 'true');
		  } else {
			// First h2 element is not visible, show the scroll-to-top link
			scrollToTopLink.style.opacity = '1';
			scrollToTopLink.setAttribute('aria-hidden', 'false');
		  }
		});
	  }
	
	  // Create a new Intersection Observer
	  const observer = new IntersectionObserver(callback, options);
	
	  // Start observing the h2 element
	if(h2Element){
		observer.observe(h2Element);
	}
	}

	// Function to hide and show the header based on scroll direction
	// An immediately-invoked function expression (IIFE) to avoid polluting the global namespace.
	function headerShowHide() {
		// Cache the header element to avoid repeatedly querying the DOM in the scroll event handler.
		const header = document.getElementById('site-header');

		// Debounce function to limit the rate at which a function can fire.
		function debounce(func, wait = 10, immediate = true) {
			// Declare a variable for the timeout.
			let timeout;

			// This is the function that will be called when debounced.
			function debounced() {
				// Capture the context (this) and arguments of the function that will be debounced.
				let context = this,
					args = arguments;

				// Function to be called after the delay. If 'immediate' is false,
				// call the debounced function.
				function later() {
					// Reset timeout to null when the wait time is over.
					timeout = null;

					// Call the function if immediate is false.
					// This will execute the function after wait time if immediate is false.
					if (!immediate) func.apply(context, args);
				}

				// If 'immediate' is true and there's no pending timeout,
				// call the function and start the wait time.
				let callNow = immediate && !timeout;

				// If a timeout is pending, clear it. This resets the timer.
				clearTimeout(timeout);

				// Start waiting by setting the timeout.
				timeout = setTimeout(later, wait);

				// If 'immediate' is true and there was no timeout pending,
				// call the function immediately without waiting.
				if (callNow) func.apply(context, args);
			}

			return debounced;
		}

		// This variable keeps track of the last scroll position.
		let lastScrollTop = 0;

		// Add a debounced event listener to the window object for scroll events.
		window.addEventListener('scroll', debounce(function() {
			// Get the current scroll position.
			let st = window.pageYOffset || document.documentElement.scrollTop;

			// If the current scroll position is greater than the last scroll position,
			// the user is scrolling down, so set the class of the header to 'closed'.
			if (st > lastScrollTop) {
				header.className = 'closed';
			} else {
				// If the current scroll position is not greater than the last scroll position,
				// the user is scrolling up, so set the class of the header to 'open'.
				header.className = 'open';
			}

			// Update lastScrollTop to the current scroll position,
			// or reset to 0 if the user has scrolled to the very top of the page.
			lastScrollTop = st <= 0 ? 0 : st;
		}), false);
	}
	
// Main function for controlling the lightbox dialog.
	function dialogLightBox() {
		// Retrieve necessary elements from the DOM.
		const lightboxGrid = document.querySelector('.lightbox-grid');
		if (!lightboxGrid) return; // If there's no lightboxGrid, don't proceed further
	
		const dialog = document.getElementById('lightbox-dialog');
		if (!dialog) return; // If there's no dialog, don't proceed further
	
		const lightboxImage = document.getElementById('lightbox-image');
		const lightboxCaption = document.getElementById('lightbox-caption');
		const lightboxCounter = document.getElementById('lightbox-counter');
		const figures = document.querySelectorAll('.lightbox-figure');
		if (!figures.length) return; // If there are no figures, don't proceed further
	
		let currentFigureIndex = 0;
	
// Map each figure to an object containing its relevant data.
		const figureData = Array.from(figures).map((figure) => {
			const img = figure.querySelector('img');
			const link = figure.querySelector('a.original-image');
			const caption = figure.querySelector('span.caption-text');
			let captionText = ""; // Initialize captionText as an empty string
			if (caption) { // If caption exists (is not null), get its textContent
				captionText = caption.textContent;
			}
			return {
				src: img.src,
				alt: img.alt,
				class: img.className,                          // Capture class
				width: img.getAttribute('width'),               // Get inline width attribute
				height: img.getAttribute('height'),             // Get inline height attribute
				link: link.outerHTML,                           // Store the entire HTML of the link
				caption: captionText                            // Store the cleaned-up caption text
			};
		});
		
		// Update the dialog with data from the figure at the given index.
		function updateDialog(index) {
			lightboxImage.src = figureData[index].src;
			lightboxImage.alt = figureData[index].alt;
			lightboxImage.className = figureData[index].class;   // Set class
			lightboxImage.setAttribute('width', figureData[index].width);  // Set width
			lightboxImage.setAttribute('height', figureData[index].height); // Set height
			lightboxCaption.innerHTML = figureData[index].caption + figureData[index].link; 
			lightboxCounter.textContent = `Viewing figure ${index + 1} of ${figureData.length}`;
		}
	

	

		// Event delegation for figures.
		lightboxGrid.addEventListener('click', function(event) {
			const figure = event.target.closest('.lightbox-figure');
			if (figure) {
				currentFigureIndex = Array.from(figures).indexOf(figure);
				updateDialog(currentFigureIndex);
				document.body.style.overflow = 'hidden'; // Prevent scrolling when dialog is open.
				dialog.showModal();
				nextButton.focus(); // Set focus on the next button after the dialog is shown.
			}
		});
	
		// Previous button event handler.
		const prevButton = document.getElementById('prev-button');
		if (prevButton) { // Check if the prevButton exists
			prevButton.addEventListener('click', () => {
				if (currentFigureIndex > 0) {
					currentFigureIndex--;
					updateDialog(currentFigureIndex);
				}
			});
		}
	
		// Next button event handler.
		const nextButton = document.getElementById('next-button');
		if (nextButton) { // Check if the nextButton exists
			nextButton.addEventListener('click', () => {
				if (currentFigureIndex < figureData.length - 1) {
					currentFigureIndex++;
					updateDialog(currentFigureIndex);
				}
			});
		}
	
		// Close button event handler.
		const closeButton = document.getElementById('close-lightbox');
		if (closeButton) { // Check if the closeButton exists
			closeButton.addEventListener('click', () => {
				dialog.close();
				document.body.style.overflow = ''; // Allow scrolling again when dialog is closed.
			});
		}
	
		// Keyboard navigation handlers.
		window.addEventListener('keydown', function(event) {
			switch (event.key) {
				case 'ArrowLeft':
					if (currentFigureIndex > 0) {
						currentFigureIndex--;
						updateDialog(currentFigureIndex);
					}
					break;
				case 'ArrowRight':
					if (currentFigureIndex < figureData.length - 1) {
						currentFigureIndex++;
						updateDialog(currentFigureIndex);
					}
					break;
					case 'Escape': 
					dialog.close();
					document.body.style.overflow = ''; // Allow scrolling again when dialog is closed.
					break;
			}
		});
	}
		

	// Wait for the DOM to load before running the following functions
	document.addEventListener("DOMContentLoaded", function() {
		updateAriaExpanded();
		handleTogglers();
		addScrollButton();
		headerShowHide();
		dialogLightBox();
	});
}());


/**
 * Object for creating click-triggered navigation submenus
 *
 git repo: https://github.com/mrwweb/clicky-menus/blob/main/clicky-menus.js
 */

(function() {

	'use strict';

	const ClickyMenus = function(menu) {

		// DOM element(s)
		let container = menu.parentElement,
			currentMenuItem,
			i,
			len;

		this.init = function(i) {
			menuSetup(i);
			document.addEventListener('click', closeOpenMenu);
		}


		/*===================================================
		=            Menu Open / Close Functions            =
		===================================================*/
		function toggleOnMenuClick(e) {

			const button = e.currentTarget;

			// close open menu if there is one
			if (currentMenuItem && button !== currentMenuItem) {
				toggleSubmenu(currentMenuItem);
			}

			toggleSubmenu(button);

		};

		function toggleSubmenu(button) {

			const submenu = document.getElementById(button.getAttribute('aria-controls'));

			if ('true' === button.getAttribute('aria-expanded')) {

				button.setAttribute('aria-expanded', false);
				submenu.setAttribute('aria-hidden', true);
				currentMenuItem = false;

			} else {

				button.setAttribute('aria-expanded', true);
				submenu.setAttribute('aria-hidden', false);
				preventOffScreenSubmenu(submenu);
				currentMenuItem = button;

			}

		};

		function preventOffScreenSubmenu(submenu) {

			const screenWidth = window.innerWidth ||
				document.documentElement.clientWidth ||
				document.body.clientWidth,
				parent = submenu.offsetParent,
				menuLeftEdge = parent.getBoundingClientRect().left,
				menuRightEdge = menuLeftEdge + submenu.offsetWidth;

			if (menuRightEdge + 32 > screenWidth) { // adding 32 so it's not too close
				submenu.classList.add('sub-menu--right');
			}

		}

		function closeOnEscKey(e) {

			if (27 === e.keyCode) {

				// we're in a submenu item
				if (null !== e.target.closest('ul[aria-hidden="false"]')) {
					currentMenuItem.focus();
					toggleSubmenu(currentMenuItem);

					// we're on a parent item
				} else if ('true' === e.target.getAttribute('aria-expanded')) {
					toggleSubmenu(currentMenuItem);
				}

			}

		}

		function closeOpenMenu(e) {

			if (currentMenuItem && !e.target.closest('#' + container.id)) {
				toggleSubmenu(currentMenuItem);
			}

		};

		/*===========================================================
		=            Modify Menu Markup & Bind Listeners            =
		=============================================================*/
		function menuSetup(i) {

			menu.classList.remove('no-js');

			/* if parent of menu has no ID, give it one */
			if (menu.parentElement.id === '') {
				menu.parentElement.id = 'clicky-menu-' + i;
			}

			menu.querySelectorAll('ul').forEach((submenu) => {

				const menuItem = submenu.parentElement;

				if ('undefined' !== typeof submenu) {

					let button = convertLinkToButton(menuItem);

					setUpAria(submenu, button, i);

					// bind event listener to button
					button.addEventListener('click', toggleOnMenuClick);
					menu.addEventListener('keyup', closeOnEscKey);

				}

			});

		};

		/**
		 * Why do this? See https://justmarkup.com/articles/2019-01-21-the-link-to-button-enhancement/
		 */
		function convertLinkToButton(menuItem) {

			const link = menuItem.getElementsByTagName('a')[0],
				linkHTML = link.innerHTML,
				linkAtts = link.attributes,
				button = document.createElement('button');

			if (null !== link) {

				// copy button attributes and content from link
				button.innerHTML = linkHTML.trim();
				for (i = 0, len = linkAtts.length; i < len; i++) {
					let attr = linkAtts[i];
					if ('href' !== attr.name) {
						button.setAttribute(attr.name, attr.value);
					}
				}

				menuItem.replaceChild(button, link);

			}

			return button;

		}

		function setUpAria(submenu, button, i) {

			const submenuId = submenu.getAttribute('id');

			let id;
			if (null === submenuId) {
				id = button.textContent.trim().replace(/\s+/g, '-').toLowerCase() + '-submenu-' + i;
			} else {
				id = menuItemId + '-submenu-' + i;
			}

			// set button ARIA
			button.setAttribute('aria-controls', id);
			button.setAttribute('aria-expanded', false);

			// set submenu ARIA
			submenu.setAttribute('id', id);
			submenu.setAttribute('aria-hidden', true);

		}

	}

	/* Create a ClickMenus object and initiate menu for any menu with .clicky-menu class */
	document.addEventListener('DOMContentLoaded', function() {
		const menus = document.querySelectorAll('.clicky-menu');
		let i = 1;

		menus.forEach(menu => {

			let clickyMenu = new ClickyMenus(menu);
			clickyMenu.init(i);
			i++;

		});
	});

}());