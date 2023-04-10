var editor;

const createEditor = (fileName) => {

    var root = document.getElementById(fileName);
    root.parentNode.insertBefore(root.cloneNode(true), root);
    root.setAttribute("style", "");
    root.setAttribute("id", "editor");

    editor = ace.edit(root);
    editor.setTheme("ace/theme/dawn");
    editor.session.setMode("ace/mode/" + fileName);
}
            
const deleteEditor = () => {
    editor.destroy();
    var el = editor.container;
    el.parentNode.removeChild(el);
    editor = null;
}

const changeTab = (button, editorNum) => {
    // Declare all variables
    let codeTab = document.getElementsByClassName("codeTab");
   
    // Get all elements with class="codeTab" & remove the class "active"
    for (let i = 0; i < codeTab.length; i++) {
        codeTab[i].className = "codeTab";
    }

    //Set clicked tab's class to "active"
    button.className += " active";

    //Check if editor is populated already. If yes, delete it & set object to null
    if(editor != null){
        deleteEditor();
        console.log("Destroyed editor");
    }

    //Create editor for tab with proper code file
    createEditor(editorNum);
}

const changeProject = (section, file) => {

    console.log("in change project start");
    if(editor != null){
        deleteEditor();
    }
    
    if(section.parentElement.open){
        section.parentElement.close;
        
        console.log("open is true");
    }else{
        console.log("in the else");
        createEditor(file);

        let projects = document.getElementsByTagName('details');

        for(let i = 0; i < projects.length; i++){
            projects[i].open = false;
        }
    }
}
