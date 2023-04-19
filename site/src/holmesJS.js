var editor0;
var editor1;

const createEditor = (fileName) => {
    let type = fileName.split(".");

    var root = document.getElementById(fileName);
    root.parentNode.insertBefore(root.cloneNode(true), root);
    root.setAttribute("style", "");
    root.setAttribute("id", 'editor');

    if(root.getAttribute('class')=='editor0'){
        editor0 = ace.edit(root);
        editor0.setTheme("ace/theme/idle_fingers");
        editor0.session.setMode("ace/mode/" + type[1]);
    }else if(root.getAttribute('class')=='editor1'){
        editor1 = ace.edit(root);
        editor1.setTheme("ace/theme/idle_fingers");
        editor1.session.setMode("ace/mode/" + type[1]);
    }
    
}
            
const deleteEditor = (file) => {

    let div = document.getElementById(file);

    if(div.getAttribute('class')=='editor0'){
        editor0.destroy();
        var el = editor0.container;
        el.parentNode.removeChild(el);
        editor0 = null;
    }else if(div.getAttribute('class')=='editor1'){
        editor1.destroy();
        var el = editor1.container;
        el.parentNode.removeChild(el);
        editor1 = null;
    }
}

const changeTab = (button, file) => {
    // Declare all variables
    let codeTab = document.getElementsByClassName("codeTab");
   
    // Get all elements with class="codeTab" & remove the class "active"
    for (let i = 0; i < codeTab.length; i++) {
        codeTab[i].className = "codeTab";
    }

    // Set clicked tab's class to "active"
    button.className += " active";

    // Check if editor is populated already. If yes, delete it & set object to null
    if(editor != null){
        deleteEditor(file);
    }

    // Create editor for tab with proper code file
    createEditor(file);
}

const changeProject = (section, file) => {

    let div = document.getElementById(file);

    if(div.getAttribute('class')=='editor0'){
        if(editor0 != null){
            deleteEditor(file);
        }
    }else if(div.getAttribute('class')=='editor1'){
        if(editor1 != null){
            deleteEditor(file);
        }
    }
    
    if(section.parentElement.open){
        section.parentElement.close;
    }else{
        createEditor(file);
    }
}

// Get button element
var button = document.querySelector(".top");

// Scroll window to top of the page
const scrollToTop = () => {
    window.scrollTo({top: 0});
}

// On scroll do something
window.onscroll = function () {handleScroll()};

const handleScroll = () => {
  if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
    // Show button
    button.classList.add("showBtn");
  } else {
    // Hide button
    button.classList.remove("showBtn");
  }
}

var names = ['Alexander_Holder', 'Alice_Rucastle',   'Alice_Turner',     'Arthur_Holder',    'Bradstreet',   'Breckinridge', 'Brigham_Young',    'Catherine Cusack', 'Charles_McCarthy', 'Clotilde_Lothman', 'Cowper',       'Enoch_J_Drebber',  'Ferrier',      'Flora_Millar', 'Francis_Moulton',  'George_Burnwell',  'Grimesby_Roylott', 'Helen_Stoner', 'Henry_Baker',  'Hosmer_Angel', 'Irene_Adler',   'Isa_Whitney',     'Jabez_Wilson', 'James_McCarthy', 'James_Ryder', 'James_Windibank', 'Jefferson_Hope', 'Jephro_Rucastle', 'John_Clay', 'John_Ferrier', 'John_Openshaw', 'John_Rance',    'John_Turner',  'John_Watson',  'Jones',        'Joseph_Smith', 'Joseph_Stangerson', 'Kate_Whitney', 'Lady_St_Simon', 'Lestrade',       'Lucy_Ferrier', 'Mary_Holder',  'Mary_Sutherland',  'Mary_Watson', 'Merryweather', 'Miss_Stoper', 'Mr_Fowler', 'Mrs_Hudson', 'Mrs_Moulton', 'Mrs_Oakshott', 'Mrs_Rucastle', 'Mrs_Sawyer',   'Mrs_St_Clair', 'Mrs_Toller', 'Mrs_Turner',     'Neville_St_Clair', 'Peterson',     'Robert_St_Simon', 'Sherlock_Holmes', 'Stamford',   'Tobias_Gregson', 'Unknown',    'Victor_Hatherley', 'Violet_Hunter', 'Wiggins',       'Wilhelm_Ormstein'];
var color = ['56, 252, 154',    '196, 192, 255',    '255, 192, 203',    '56, 105, 252',      '252, 252, 93', '115, 0, 255', '45, 128, 121',     '122, 89, 101',     '211, 255, 189',    '24, 92, 99',       '255, 0, 247','255, 255, 255',    '133, 182, 255',  '145, 52, 52',  '255, 168, 168',    '183, 151, 186',    '185, 252, 104',     '156, 100, 3','21, 128, 3',   '128, 3, 109',  '255, 165, 0',  '250, 57, 134',    '255, 212, 128','111, 130, 104',  '112, 91, 42', '65, 108, 120',    '94, 73, 117',    '235, 119, 117',   '0, 45, 128','138, 131, 72', '0, 255, 98', '229, 255, 0', '107, 140, 129','69, 69, 69',   '75, 72, 122',       '170, 0, 255',  '250, 0, 0',      '173, 49, 0',   '89, 107, 57',   '158, 157, 157',  '189, 255, 242','255, 189, 227','76, 175, 80',      '245, 83, 83',   '149, 186, 0',   '150, 54, 122','0, 72, 186','73, 84, 102','255, 0, 238', '255, 77, 118', '168, 40, 51',  '139, 255, 43','219, 176, 149','94, 65, 46', '123, 159, 179',  '108, 89, 128',     '133, 165, 255','110, 106, 0',     '0, 255, 255',     '176, 11, 49','191, 255, 196',  '13, 0, 255', '79, 160, 255',       '166, 0, 255',   '255, 212, 212', '171, 135, 255'];

const highlight = (check) => {
    var pos;
    var name = check.value;

    for(let i = 0; i < names.length; i++){
        if(names[i]==name){
            pos = i;
            break;
        }
    }

    if(!check.hasAttribute('id')){
        let quotes = document.getElementsByClassName(name);

        for(let i = 0; i < quotes.length; i++){
            if(!quotes[i].hasAttribute('style')){
                quotes[i].setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
            }else{
                quotes[i].removeAttribute('style');
            }
        }
    }else{
        let id = check.getAttribute('id').split('.');
        let chapter = document.getElementById(id[1]);

        for(const child of chapter.children) {
            for(const child2 of child.children){
                if(child2.getAttribute('class') == name){
                    if(!child2.hasAttribute('style')){
                        child2.setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
                    }else{
                        child2.removeAttribute('style');
                    }
                }
            }
        }
    }
}

const checkAll = (button) => {
    let element = button.parentElement.parentElement;
    var pos;

    let checks = element.getElementsByClassName('check');

    for(let i = 0; i < checks.length; i++){
        checks[i].checked = true;

        var name = checks[i].getAttribute('value');
        
        for(let t = 0; t < names.length; t++){
            if(names[t]==name){
                pos = t;
                break;
            }
        }

        if(!checks[i].hasAttribute('id')){
            let quotes = document.getElementsByClassName(name);

            for(let k = 0; k < quotes.length; k++){
    
                quotes[k].setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
            }
        }else{
            let id = checks[i].getAttribute('id').split('.');
            let chapter = document.getElementById(id[1]);

            for(const child of chapter.children) {
                for(const child2 of child.children){
                    if(child2.getAttribute('class') == name){
                        child2.setAttribute('style', 'background: rgba('+color[pos]+', 0.3);');
                    }
                }
            }
        }
        
    }
}

const unCheckAll = () => {

    let checks = document.getElementsByClassName("check");

    for(let i = 0; i < checks.length; i++){
        checks[i].checked = false;
    }

    let quotes = document.getElementsByTagName('span')

    for(let i = 0; i < quotes.length; i++){
        if(quotes[i].hasAttribute('style')){
            quotes[i].removeAttribute('style');
        }
    }
}

const center = () => {
    let element = document.getElementById('postText');

    setTimeout(scroll = () =>{
        element.scrollIntoView(true)
    }, 500);
}