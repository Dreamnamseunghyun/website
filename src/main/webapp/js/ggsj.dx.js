(function (window) {
    'use strict';

    let sitebuilder = window.sitebuilder || {};

    /** @param _dxInstances : {btnAttach,btnCreate,btnDelete,btnEdit,btnList,btnSave,btnTargetSearch} */
    let _dxInstances = {};

    sitebuilder.createDx = function (bReadOnly) {
        bReadOnly = !!bReadOnly;

        $('[data-sitebuilder*="dx"]').each(function (index, item) {
            let id = $(item).attr('id');
            if (!id) {
                return;
            }

            let dataType = $(item).attr('data-sitebuilder');
            let dataFormat = $(item).attr('data-sitebuilder-format');

            _dxInstances[id] = ($(item)[dataType]())[dataType]('instance');
            _dxInstances[id].option({readOnly: bReadOnly});

            if (dataType === 'dxDataGrid' || dataType === 'dxTreeList') {
                _dxInstances[id].option({stateStoring: {storageKey: id,}});
            } else if (dataType === 'dxTextBox' && dataFormat === 'tel') {
                _dxInstances[id].option({
                    maxLength: 11,
                    onKeyPress: function (e) {
                        console.log(e.event.keyCode);
                        if (e.event.keyCode < 48 || e.event.keyCode > 57) {
                            e.event.preventDefault();
                        }
                    },
                    onFocusIn: function (e) {
                        let value = e.component.option('value');
                        value = value.replace(/-/g, '');
                        e.component.option('value', value);
                    },
                    onFocusOut: function (e) {
                        let value = e.component.option('value');
                        value = sitebuilder.phoneWithHyphen(value);
                        e.component.option('value', value);
                    },
                });
            }
        });

        return _dxInstances;
    };

    sitebuilder.valuesToDx = function (values) {
        let dotizedValues = sitebuilder.dotize.convert(values);
        for (let id in dotizedValues) {
            if (!dotizedValues.hasOwnProperty(id)) {
                continue;
            }

            if (_dxInstances[id] && typeof _dxInstances[id].option === 'function') {
                if (_dxInstances[id].element().attr('data-sitebuilder-format') === 'tel') {
                    _dxInstances[id].option({value: sitebuilder.phoneWithHyphen(dotizedValues[id])});
                } else {
                    _dxInstances[id].option({value: dotizedValues[id]});
                }
            } else {
                _dxInstances[id] = dotizedValues[id];
            }
        }
    };

    sitebuilder.dxToValues = function () {
        let values = {};

        for (let id in _dxInstances) {
            if (!_dxInstances.hasOwnProperty(id)) {
                continue;
            }

            if (_dxInstances[id] && typeof _dxInstances[id].option === 'function') {
                if (_dxInstances[id].option().value !== undefined) {
                    if (_dxInstances[id].element().attr('data-sitebuilder-format') === 'tel') {
                        values[id] = _dxInstances[id].option().value.replace(/-/g, '');
                    } else {
                        values[id] = _dxInstances[id].option().value;
                    }
                }
            } else {
                values[id] = _dxInstances[id];
            }
        }

        return sitebuilder.dotize.backward(values);
    }

    window.sitebuilder = sitebuilder;
})(window);
