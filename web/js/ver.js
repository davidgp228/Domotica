/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function publicar(id){
    var valor=document.getElementById(id).value;
    
    $.get('Ajax',{accion:'publicar',valor:valor},function (data){
                alert("Foco toggle");
    });
}
