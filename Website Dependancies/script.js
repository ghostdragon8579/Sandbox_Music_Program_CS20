const tagSelectors = [
  {
    id: 'TitleFormat',
    tag: 'h1',
    name: 'First Title Format',
    parent: 'header',
    class: 'TitleFormat',
    sibling: 0,
    text: ''
  },
  {
    id: 'TitleFormat',
    tag: 'h2',
    name: 'Second Title Format',
    parent: 'div#element-0',
    class: 'TitleFormat',
    sibling: 0,
    text: ''
  },
  {
    id: 'TitleFormat',
    tag: 'h3',
    name: 'Third Title Format',
    parent: 'div#element-0',
    class: 'TitleFormat',
    sibling: 1,
    text: ''
  },
  {
    id: 'TitleFormat',
    tag: 'h4',
    name: 'Fourth Title Format',
    parent: 'div#element-1',
    class: 'TitleFormat',
    sibling: 0,
    text: ''
  },
  {
    id: 'TitleFormat',
    tag: 'h5',
    name: 'Fifth Title Format',
    parent: 'div#element-1',
    class: 'TitleFormat',
    sibling: 1,
    text: ''
  },
  {
    id: 'PreviousButton',
    tag: 'button',
    name: 'Previous Button',
    parent: 'div#element-1',
    sibling: 2,
    text: 'Previous'
  },
  {
    id: 'RewindButton',
    tag: 'button',
    name: 'Rewind Button',
    parent: 'div#element-1',
    sibling: 3,
    text: 'Rewind'
  },
  {
    id: 'Play/PauseButton',
    tag: 'button',
    name: 'Play/Pause Button',
    parent: 'div#element-1',
    sibling: 4,
    text: 'Play/Pause'
  },
  {
    id: 'SkipButton',
    tag: 'button',
    name: 'Skip Button',
    parent: 'div#element-1',
    sibling: 5,
    text: 'Skip'
  },
  {
    id: 'NextButton',
    tag: 'button',
    name: 'Next Button',
    parent: 'div#element-1',
    sibling: 6,
    text: 'Next'
  },
  {
    id: 'CopyRight',
    tag: 'p',
    name: 'Copy Right',
    sibling: 0,
    text: ''
  },  
  {
    tag: 'ul',
    name: 'Unordered list tag',
    parent: 'div#element-1',
    sibling: 1,
    text: ''
  },
  {
    tag: 'li',
    name: 'Description',
    parent: 'div#element-1 ul',
    sibling: 0,
    text: ''
  },
  {
    tag: 'h1',
    name: 'Image',
    parent: 'div#element-2',
    sibling: 0,
    text: ''
  },
  {
    tag: 'p',
    name: 'Image description',
    parent: 'div#element-3',
    sibling: 0,
    text: ''
  },
  {
    id: 'QueenElizabethLogo',
    tag: 'Image',
    name: 'Queen Elizabeth Logo',
    sibling: 0,
    text: ''
  },
  {
    id: 'DesignImage',
    tag: 'Image',
    name: 'Design Image',
    sibling: 0,
    text: ''
  },
  {
    id: 'ColorImage',
    tag: 'Image',
    name: 'Color Image',
    sibling: 0,
    text: ''
  },
]

document.onload = main();

function main() {
  let isAllTagsPresent = true;
  const isChecklist = window.location.search === '?testing';

  createIds();
  if (isChecklist) {
    createChecklist();
  }
  tagSelectors.map(selector => {
    if (isChecklist) {
      createChecklistItem(selector);
    }

    if (!tagExists(selector)) {
      addElement(selector);
      isAllTagsPresent = false;
    }
  });

  document.querySelectorAll('section')[1].setAttribute('class', 'bg1');
  if (isChecklist) {

    isAllTagsPresent ?
      document.querySelector('#checklist').setAttribute('id', 'complete') :
      document.querySelector('#checklist').setAttribute('id', 'incomplete');
  }
}
function createIds() {
  const divs = document.querySelectorAll('div');

  divs.forEach((div, index) => div.setAttribute('id', `element-${index}`));
}

function tagExists(selector) {
  const element = document.querySelector(selector.tag);

  return document.body.contains(element);
}

function addElement(selector) {
  const element = document.createElement(selector.tag);
  const elementContent = document.createTextNode(selector.text);
  element.appendChild(elementContent);

  const parent = document.querySelector(selector.parent);
  parent.insertBefore(element, parent.children[selector.sibling]);
}

function createChecklist() {
  const section = document.createElement('section');
  section.setAttribute('id', 'checklist')

  const header = document.querySelector('header');
  const body = document.querySelector('body');
  body.insertBefore(section, header);
}

function createChecklistItem(selector) {
  const section = document.querySelector('section#checklist');
  const checklistItem = document.createElement('i');
  checklistItem.setAttribute('class', tagExists(selector) ? 'fas fa-check' : 'fas fa-times');
  const checklistItemContent = document.createTextNode(selector.name);

  checklistItem.appendChild(checklistItemContent);
  section.appendChild(checklistItem);
}
