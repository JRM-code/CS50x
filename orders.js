//Pies ordered
S = parseInt(document.getElementById("txt1").value);
L = parseInt(document.getElementById("txt2").value);
SB = parseInt(document.getElementById("txt3").value);
A = parseInt(document.getElementById("txt4").value);
C = parseInt(document.getElementById("txt5").value);
P = parseInt(document.getElementById("txt6").value);

//Calculates the cost of the pie order.
function numCalc(S, L, SB, A, C, P) {
    var numPie = (1 * txt1.value) + (1 * txt2.value) + (1 * txt3.value) + (1 * txt4.value) + (1 * txt5.value) + (1 * txt6.value);
         document.getElementById("result1").innerHTML = numPie;
        }

function costCalc(S, L, SB, A, C, P) {
    var cost = ((10 * txt1.value) + (12 * txt2.value) + (12 * txt3.value) + (10 * txt4.value) + (11 * txt5.value) + (12 * txt6.value)).toFixed(2);
         document.getElementById("result2").innerHTML = cost;
        }
