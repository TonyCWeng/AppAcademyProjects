const DOMNodeCollection = require('./dom_node_collection.js');

const $l = (selector) => {

  switch (typeof selector) {
    case "string":
      const nodeList = document.querySelectorAll(selector);
      const elementList = [];
      for (var i = 0; i < nodeList.length; i++) {
        elementList.push(nodeList[i]);
      }
      return new DOMNodeCollection(elementList);

    case HTMLElement:
      return new DOMNodeCollection([selector]);
  }
};

window.$l = $l;
