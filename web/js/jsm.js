mcdis = new Array ("&Aacute;lvaro Obreg&oacute;n","Azcapotzalco","Benito Ju&aacute;rez","Coyoac&aacute;n","Cuajimalpa de Morelos","CuauhtÃ©moc","Gustavo A. Madero","Iztacalco","Iztapalapa","Magdalena Contreras","Miguel Hidalgo","Milpa Alta","Tl&aacute;huac","Tlalpan","Venustiano Carranza","Xochimilco") ;
mchid = new Array ("Tizayuca");
mcedo = new Array ("Acolman","Amecameca","Apaxco","Atenco","Atizap&aacute;n de Zaragoza","Atlautla","Axapusco","Ayapango","Coacalco de BerriozÃ¡bal","CocotitlÃ¡n","Coyotepec","CuautitlÃ¡n","Chalco","Chiautla","Chicoloapan","Chiconcuac","ChimalhuacÃ¡n","Ecatepec de Morelos","Ecatzingo","Huehuetoca","Hueypoxtla","Huixquilucan","Isidro Fabela","Ixtapaluca","Jaltenco","Jilotzingo","Juchitepec","Melchor Ocampo","Naucalpan de JuÃ¡rez","NezahualcÃ³yotl","Nextlalpan","NicolÃ¡s Romero","Nopaltepec","Otumba	","Ozumba","Papalotla","La Paz","San MartÃ­n de las PirÃ¡mides","TecÃ¡mac","Temamatla","Temascalapa","Tenango del Aire","Teoloyucan","TeotihuacÃ¡n","Tepetlaoxtoc","Tepetlixpa","TepotzotlÃ¡n","Tequixquiac","Texcoco","Tezoyuca","Tlalmanalco","Tlalnepantla de Baz","Tultepec","TultitlÃ¡n","Villa del CarbÃ³n","Zumpango","CuautitlÃ¡n Izcalli","Valle de Chalco Solidaridad","Tonanitla") ;

function del(deleg, col){
                var cuantos = col.length;
                for (i = 1; i <= cuantos; i++){
                    col.options [i] = null;
                }
                switch (deleg.selectedIndex){
                    case 1:
                        for (cont = 0; cont<16; cont++)
                            col.options[cont+1] = new Option (mcdis[cont]);
                        break;
                    case 2:
                        for (cont = 0; cont<mcedo.length; cont++)
                            col.options[cont+1] = new Option (mcedo[cont]);
                        break;
                    case 3:
                        for (cont = 0; cont<1; cont++)
                            col.options[cont+1] = new Option (mchid[cont]);
                        break;    
    }
}


function sololetras(event)
{
    var x = event.which || event.keyCode;
    if ((x >= 97 && x <= 122) ||
            (x >= 65 && x <= 90) ||
            (x === 8 && x === 32 || x === 224 || x === 232 ||
                    x === 236 || x === 242 || x === 249 || x === 241))
        return true;
    else
        return false;

}
function soloenteros(e)
{
    var keynum = e.which || e.keyCode;
    if ((keynum >= 48 && keynum <= 57) || keynum === 8)
        return true;
    else
        return false;
}

