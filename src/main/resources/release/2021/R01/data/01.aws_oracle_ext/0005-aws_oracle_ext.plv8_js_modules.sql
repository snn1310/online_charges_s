INSERT INTO aws_oracle_ext.plv8_js_modules ("module",autoload,"source") VALUES 
(
    'Tree', false,
$$'use strict';class Leaf{constructor(a,b,c){this.parent=a,this.key=b,this.value=c}toString(){return""+this.key}}class TreeNode{constructor(a,b,c,d,e,f){this.order=a,this.minOrder=b,this.parent=c,this.leaves=d||[],this.leaves.forEach(function(a){a.parent=this},this),this.nodes=e||[null],this.nodes.forEach(function(a){null!==a&&(a.parent=this)},this),this.compare=f}search(c){if(0<this.leaves.length){let d=1,e=this.leaves[0];if(0==this.compare(e.key,c))return{leaf:e,index:0};if(0>this.compare(c,e.key))return null===this.nodes[0]?{node:this,index:0}:this.nodes[0].search(c);for(let a=1;a<this.leaves.length;a++){d++;const f=this.leaves[a];if(0==this.compare(f.key,c))return{leaf:f,index:a};if(0>this.compare(c,f.key))return null===this.nodes[a]?{node:this,index:a}:this.nodes[a].search(c);e=f}return null===this.nodes[d]?{node:this,index:d}:this.nodes[d].search(c)}return{node:this,index:0}}getValue(a){const b=this.search(a);return b.leaf?b.leaf.value:void 0}putValue(a,b,c){let d=null===b?null:b!==emptyCollectionElement&&"object"==typeof b?b.clone():b;const e=this.search(a);if(e.leaf)return!!("undefined"==typeof c||c)&&(e.leaf.value=d,!0);const f=e.node,g=e.index;return f.leaves.splice(g,0,new Leaf(f,a,d)),f.nodes.splice(g+1,0,null),f.leaves.length>this.order&&f.split(),!0}del(a){const b=this.search(a);if(!b.leaf)return!1;const c=b.leaf,d=c.parent,e=b.index,f=d.nodes[e];if(null===f)d.leaves.splice(e,1),d.nodes.splice(e,1),d.balance();else{const a=f.leaves[f.leaves.length-1];f.del(a.key),a.parent=d,d.leaves.splice(e,1,a)}return!0}balance(){if(this.parent instanceof Tree)return void(0==this.leaves.length&&null!==this.nodes[0]&&(this.parent.root=this.nodes[0],this.parent.root.parent=this.parent));if(this.leaves.length>=this.minOrder)return;const a=TreeUtility.arraySearch(this.parent.nodes,this),b=0<a?this.parent.nodes[a-1]:null,c=this.parent.nodes.length>a+1?this.parent.nodes[a+1]:null;let d,e,f;if(null!==c&&c.leaves.length>this.minOrder)d=this.parent.leaves[a],d.parent=this,this.leaves.push(d),e=c.leaves.shift(),e.parent=this.parent,this.parent.leaves[a]=e,f=c.nodes.shift(),null!==f&&(f.parent=this),this.nodes.push(f);else if(null!==b&&b.leaves.length>this.minOrder)d=this.parent.leaves[a-1],d.parent=this,this.leaves.unshift(d),e=b.leaves.pop(),e.parent=this.parent,this.parent.leaves[a-1]=e,f=b.nodes.pop(),null!==f&&(f.parent=this),this.nodes.unshift(f);else{let e;if(null!==c)d=this.parent.leaves[a],e=new TreeNode(this.order,this.minOrder,this.parent,[...this.leaves,...[d],...c.leaves],[...this.nodes,...c.nodes],this.compare),this.parent.leaves.splice(a,1),this.parent.nodes.splice(a,2,e);else if(null!==b)d=this.parent.leaves[a-1],e=new TreeNode(this.order,this.minOrder,this.parent,[...b.leaves,...[d],...this.leaves],[...b.nodes,...this.nodes],this.compare),this.parent.leaves.splice(a-1,1),this.parent.nodes.splice(a-1,2,e);else throw new Error(`Internal error: ${this.toString(!0)} has neither a left nor a right sibling`);this.parent.balance()}}unsplit(c,d){c.parent=this,d.parent=this;let e=this.leaves[0],a=1;if(0>this.compare(c.key,e.key))this.leaves.unshift(c),this.nodes.splice(1,0,d);else{for(let e=1;e<this.leaves.length;e++){a++;let f=this.leaves[e];if(0>this.compare(c.key,f.key)){this.leaves.splice(e,0,c),this.nodes.splice(e+1,0,d);break}}a==this.leaves.length&&(this.leaves.push(c),this.nodes.push(d))}this.leaves.length>this.order&&this.split()}split(){const a=Math.floor(this.leaves.length/2);if(this.parent instanceof Tree)this.nodes=[new TreeNode(this.order,this.minOrder,this,this.leaves.slice(0,a),this.nodes.slice(0,a+1),this.compare),new TreeNode(this.order,this.minOrder,this,this.leaves.slice(a+1),this.nodes.slice(a+1),this.compare)],this.leaves=[this.leaves[a]];else{const b=this.leaves[a],c=new TreeNode(this.order,this.minOrder,this.parent,this.leaves.slice(a+1),this.nodes.slice(a+1),this.compare);this.leaves=this.leaves.slice(0,a),this.nodes=this.nodes.slice(0,a+1),this.parent.unsplit(b,c)}}toString(a){const b=[];for(let c=0;c<this.leaves.length;c++)b.push(this.leaves[c].key);let c=`[${b.toString()}]${this.parent instanceof Tree?":*":":"+this.parent}`;if(a)for(let a=0;a<this.nodes.length;a++)c+=" -> "+this.nodes[a];return c}}module.exports=class a{constructor(a,b){var c=Math.floor;this.order=a,this.compare=TreeUtility.numberCompare;let d;switch(typeof a){case"undefined":d=52;break;case"number":d=c(a);break;default:d=parseInt(a,10);}1>d&&(d=1),this.minOrder=1<d?c(d/2):1,"function"==typeof b&&(this.compare=b),this.root=new TreeNode(this.order,this.minOrder,this,null,null,this.compare)}putValue(a,b,c){if("undefined"==typeof a||null===a)throw new Error(`Illegal key: ${a}`);if("undefined"==typeof b)throw new Error(`Illegal value: ${b}`);return this.root.putValue(a,b,c)}getValue(a){if("undefined"==typeof a||null===a)throw new Error(`Illegal key: ${a}`);return this.root.getValue(a)}del(a){if("undefined"==typeof a||null===a)throw new Error(`Illegal key: ${a}`);return this.root.del(a)}walkAsc(b,c,d){if(0==this.root.leaves.length)return;"function"==typeof b?(d=b,b=c=null):"function"==typeof c&&(d=c,c=null),b="undefined"==typeof b?null:b,c="undefined"==typeof c?null:c;let e,f;if(null===b){for(e=this.root;null!==e.nodes[0];)e=e.nodes[0];f=0}else{const c=this.root.search(b);if(c.leaf)e=c.leaf.parent,f=TreeUtility.arraySearch(e.leaves,c.leaf);else if(e=c.node,f=c.index,f>=e.leaves.length){if(e.parent instanceof a)return;if(f=TreeUtility.arraySearch(e.parent.nodes,e),f>=e.parent.leaves.length)return;e=e.parent}}for(;!0&&!(null!==c&&0<this.compare(e.leaves[f].key,c));){if(d(e.leaves[f].key,e.leaves[f].value))break;if(null!==e.nodes[f+1])for(e=e.nodes[f+1],f=0;null!==e.nodes[0];)e=e.nodes[0];else if(e.leaves.length>f+1)f++;else do{if(e.parent instanceof a)return;f=TreeUtility.arraySearch(e.parent.nodes,e),e=e.parent}while(f>=e.leaves.length)}}walkDesc(b,c,d){"function"==typeof b?(d=b,b=c=null):"function"==typeof c&&(d=c,c=null),b="undefined"==typeof b?null:b,c="undefined"==typeof c?null:c;let e,f;if(null===c){for(e=this.root;null!==e.nodes[e.nodes.length-1];)e=e.nodes[e.nodes.length-1];f=e.leaves.length-1}else{const b=this.root.search(c);if(b.leaf)e=b.leaf.parent,f=TreeUtility.arraySearch(e.leaves,b.leaf);else for(e=b.node,f=b.index-1;0>f;){if(e.parent instanceof a)return;if(f=TreeUtility.arraySearch(e.parent.nodes,e)-1,0>f)return;e=e.parent}}for(;!0&&!(null!==b&&0>this.compare(e.leaves[f].key,b));){if(d(e.leaves[f].key,e.leaves[f].value))break;if(null!==e.nodes[f]){for(e=e.nodes[f];null!==e.nodes[e.nodes.length-1];)e=e.nodes[e.nodes.length-1];f=e.leaves.length-1}else if(0<f)f--;else do{if(e.parent instanceof a)return;f=TreeUtility.arraySearch(e.parent.nodes,e)-1,e=e.parent}while(0>f)}}count(a,b){let c=0;return this.walkAsc("undefined"==typeof a?null:a,"undefined"==typeof b?null:b,function(){c++}),c}toString(){return`Tree(${this.order}) ${this.root.toString()}`}};$$
)
,
(    'Pathparser', false,
$$'use strict';module.exports=class{constructor(a){this.groups=["q","dot","idx","uq"],this.re=new RegExp(/(?:(?:((?:(?:"[^"]+"))))|(?:((?:(?:(?:\.)))))|(?:((?:(?:\[[^\[\]]+\]))))|(?:((?:(?:[^\[\]"\.]+)))))/my),this.groupCount=this.groups.length,this.index=0,this.buffer=a||""}getPart(){const a=this.index,b=this.buffer;if(a===b.length)return;let c=this.re;c.lastIndex=a;const d=c.exec(b);let e;const f=this.groups.length;for(let a=0;a<f;a++)if(void 0!==d[a+1]){e=this.groups[a];break}const g="uq"==e?d[0].toLowerCase():d[0],h={group:e,text:g};return this.index+=g.length,h}getTokens(){let a=[],b=this.getPart();for(;"undefined"!=typeof b;)a.push(b),b=this.getPart();return a}};$$
),
(
    'TreeUtility', false,
$$'use strict';module.exports=class a{static arraySearch(b,a){let c=0;for(let d=0;d<b.length;d++)if(c++,b[d]===a)return d;return-c}static numberCompare(c,a){return c<a?-1:c>a?1:0}static stringCompare(c,a){for(let b=0;b<c.length;b++){if(b>=a.length)return 1;const d=c.charCodeAt(b),e=a.charCodeAt(b);if(d<e)return-1;if(d>e)return 1}return c.length==a.length?0:-1}static clone(){let a;const b=this;if(b instanceof Tree)return a=new Tree(b.order,b.compare),b.walkAsc(null,null,function(b,c){a.putValue(b,c)}),a.collectionType=b.collectionType,a.indexBy=b.indexBy,a.rowType=b.rowType,a;if(b instanceof Date)return new Date(b.getTime());for(const c in a={},b)if(b.hasOwnProperty(c)){const d=b[c];a[c]="object"==typeof d&&null!==d?b[c].clone():b[c]}return a}static setBypath(b,c,d){if(0!=c.length){const e=c[0];return"dot"===e.group?a.setBypath(b,c.slice(1),d):(1===c.length?b[e.text]=d:b.hasOwnProperty(e.text)?"object"!=typeof b[e.text]&&(b[e.text]={}):b[e.text]={},a.setBypath(b[e.text],c.slice(1),d))}}};$$
),
(
    'StringUtils', false,
$$'use strict';const splitBy=function(a,b=",",c){let d=[""];const e=null==c?[]:c;let f="",g=-1;for(;g<a.length-1;){const c=a[++g];if(e.includes(c)){const b=g+1,e=a.indexOf(c,b);if(-1<e){f+=c,f+=a.slice(b,e),f+=a[e],g=e,d.push(f),f="";continue}}if(c===b){d.push(f),f="";continue}f+=c,g==a.length-1&&d.push(f)}return d},arr=a=>Array.from(a),num=a=>+a||0,isEmpty=a=>0===a.length,take=a=>b=>b.slice(0,a),drop=a=>b=>b.slice(a),reverse=a=>a.slice(0).reverse(),comp=a=>b=>c=>a(b(c)),not=a=>!a,chunk=a=>b=>isEmpty(b)?[]:[take(a)(b),...chunk(a)(drop(a)(b))],numToWords=c=>{const d=["","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"],a=["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"],b=["","thousand","million","billion","trillion","quadrillion","quintillion","sextillion","septillion","octillion","nonillion"];return"number"==typeof c?numToWords(c+""):"0"===c?"zero":comp(chunk(3))(reverse)(arr(c)).map(([b,c,e])=>[0===num(e)?"":d[e]+" hundred ",0===num(b)?a[c]:a[c]&&a[c]+"-"||"",d[c+b]||d[b]].join("")).map((a,c)=>""===a?a:`${a} ${b[c]}`).filter(comp(not)(isEmpty)).reverse().join(" ")},getGetOrdinal=function(a){const b=["th","st","nd","rd"],c=a%100;return b[(c-20)%10]||b[c]||b[0]},toTitleCase=a=>a.toLowerCase().split(" ").map(a=>a.charAt(0).toUpperCase()+a.slice(1)).join(" "),replaceAtposition=(a,b,c)=>0>b||b>a.length-1?a:a.slice(0,b)+c+a.slice(b+1);module.exports={splitBy:splitBy,numToWords:numToWords,toTitleCase:toTitleCase,replaceAtposition:replaceAtposition};$$
),
(
    'PackageTools', false,
$$'use strict';const deepFreeze=function a(b){const c=Object.getOwnPropertyNames(b);return c.forEach(function(c){let d=b[c];"object"==typeof d&&null!==d&&a(d)}),Object.freeze(b)},deepCopy=function a(b,c){if("undefined"==typeof b||"object"!=typeof b||null==b||b instanceof Date)throw new Error(`source is incorrect`);if("undefined"==typeof c||"object"!=typeof c||null==c||c instanceof Date)throw new Error(`destination is incorrect`);const d=Object.keys(c),e=Object.keys(b);if(d.length!=e.length)throw new Error(`wrong number of fields`);const f=Object.values(b);for(let e=0;e<f.length;e++)f[e]instanceof Date||"object"!=typeof f[e]||null===f[e]?c[d[e]]=f[e]:a(f[e],c[d[e]])},setRecordField=function a(b,c,d){if(!Array.isArray(c))throw new Error(`variable path ${c} is incorrect`);if(0!=c.length){const e=c[0];if("dot"===e.group)return a(b,c.slice(1),d);if(1===c.length){if(!b.hasOwnProperty(e.text))throw new Error(`Field ${e.text} does not exists`);"object"!=typeof b[e.text]||null==b[e.text]||b[e.text]instanceof Date?b[e.text]=d:deepCopy(d,b[e.text])}return a(b[e.text],c.slice(1),d)}},getRecordField=function a(b,c){if(!Array.isArray(c))throw new Error(`variable path ${c} is incorrect`);if(0==c.length)throw new Error(`variable path ${c} is incorrect`);const d=c[0];if("dot"===d.group)return a(b,c.slice(1));if(1===c.length){if(!b.hasOwnProperty(d.text))throw new Error(`Field ${d.text} does not exists`);return b[d.text]}return a(b[d.text],c.slice(1))},partsCompare=function(c,a){if(!Array.isArray(c)||!Array.isArray(a))throw new Error(`variable path is incorrect`);if(0==c.length||0==a.length)throw new Error(`variable path is incorrect`);if(c.length!=a.length)return!1;for(let b=0;b<c.length;b++){if(c[b].group!==a[b].group)return!1;if(0!=TreeUtility.stringCompare(c[b].text,a[b].text))return!1}return!0};module.exports={deepFreeze:deepFreeze,deepCopy:deepCopy,setRecordField:setRecordField,partsCompare:partsCompare,getRecordField:getRecordField};$$
)
ON CONFLICT (module)
DO UPDATE SET autoload = EXCLUDED.autoload,
    source = EXCLUDED.source;