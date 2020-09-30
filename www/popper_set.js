function walkthrough() {
  document.querySelector('#tooltip1').style.visibility="visible"
} 

function advance1() {
  document.querySelector('#tooltip1').style.visibility="hidden";
  document.querySelector('#tooltip2').style.visibility="visible"
} 

function advance2() {
  document.querySelector('#tooltip2').style.visibility="hidden"
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
