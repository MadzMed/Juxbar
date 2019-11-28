function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}


async function playerAdvance() {
  const listTop = document.getElementById("top-waves").children;
  const listBottom = document.getElementById("bottom-waves").children;

  for (let i=0; i< listTop.length; i+=1) {
    if (listTop[i].attributes !== undefined && listBottom[i].attributes !== undefined) {
        listTop[listTop.length - 1 - i].attributes["6"].nodeValue = "#BA1B1D";
        listBottom[i].attributes["6"].nodeValue = "#BA1B1D";
        await sleep(500);
    }
  }
}

export { playerAdvance }
