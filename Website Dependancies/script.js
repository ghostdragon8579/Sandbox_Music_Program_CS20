const tagSelectors = [
  {
    id: 'TitleFormat1',
    tag: 'h1',
    name: 'Title',
    parent: 'header',
    sibling: 0,
    text: 'Put your title here'
  },
  {
    id: 'TitleFormat2',
    tag: 'h2',
    name: 'Name',
    parent: 'div#element-0',
    sibling: 0,
    text: ''
  },
  {
    id: 'TitleFormat3',
    tag: 'h3',
    name: 'Grade',
    parent: 'div#element-0',
    sibling: 1,
    text: ''
  },
  {
    tag: 'h4',
    name: '\"Who Am I\" header',
    parent: 'div#element-1',
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
    id: 'DesignImage',
    tag: 'Image',
    src: 'Music_Program_Images/PXL_20250207_220511935.MP.jpg',
    alt: 'Error 404 Image not found',
    title: 'Planned design for Music_Program_CS20',
    style: 'width:50vw',
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
