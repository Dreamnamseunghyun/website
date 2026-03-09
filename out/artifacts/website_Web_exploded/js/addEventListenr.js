// ?ㅻ줈媛湲곗떆 寃쎄퀬

window.addEventListener('beforeunload', function (event) {
    // ?쒖????곕씪 湲곕낯 ?숈옉 諛⑹?
    event.preventDefault();
    // Chrome?먯꽌??returnValue ?ㅼ젙???꾩슂??    event.returnValue = '';
});

window.onbeforeunload = function (e) {
    var dialogText = 'Dialog text here';
    e.returnValue = dialogText;
    return e;
};
