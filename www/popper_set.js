var order = 1;
  
function walkthrough() {
  document.querySelector(`[tip-number="${order}"]`).classList.add("tip-active");
} 

function advance() {
  document.querySelector(`[tip-number="${order}"]`).classList.remove("tip-active");
  document.querySelector(`[tip-number="${order}"]`).classList.add("tip-hidden");
  document.querySelector(`[tip-number="${order+1}"]`).classList.add("tip-active");
  order = order + 1;
}


function advance1() {
  document.querySelector('#tooltip1').classList.remove("tip-active");
  document.querySelector('#tooltip1').classList.add("tip-hidden");
  document.querySelector('#tooltip2').classList.add("tip-active");
}

function advance2() {
  document.querySelector('#tooltip2').classList.remove("tip-active");
  document.querySelector('#tooltip2').classList.add("tip-hidden");
}

const target1 = document.querySelector('#bins');
const tooltip1 = document.querySelector('#tooltip1');

const target2 = document.querySelector('#distPlot');
const tooltip2 = document.querySelector('#tooltip2');

Popper.createPopper(target1, tooltip1,
                    {
                      placement:'bottom',
                      modifiers: [
                        {
                          name: 'offset',
                          options: {
                            offset: [0, 60],
                          }
                        }
                        ]
                    });

Popper.createPopper(target2, tooltip2,
                    {
                      placement:'left',
                      modifiers: [
                        {
                          name: 'offset',
                          options: {
                            offset: [0,40],
                          }
                        }
                        ]
                    });
