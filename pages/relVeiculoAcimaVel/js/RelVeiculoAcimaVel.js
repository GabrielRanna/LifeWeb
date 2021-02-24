Cmp.RelVeiculoAcimaVel = function() {
    
    var private = {

        render: function() {

            Cmp.createInput({
                id: 'inputPlaca',
                renderTo: '#divInputPlaca',
                label: 'Placa do veículo',
                width: '200px'
            });

            Cmp.createButton({
                id: 'btnBuscar',
                renderTo: '#divBtnConsultar',
                text: 'Buscar',
                handler: function() {
                    private.buscar();
                }
            });

            Cmp.createGrid({
                id: 'gridDadosRelVeiculoAcimaVel',
                renderTo: '#divCmpGridRelatorioAcimaVel',
                header: [
                    {
                        text: 'Placa',
                        field: 'placa'
                    }, {
                        text: 'Funcionario',
                        field: 'nome',
                        width: 150
                    }, {
                        text: 'Data',
                        field: 'data',
                        width: 150
                    }, {
                        text: 'Vel. Max.',
                        field: 'vel_maxima',
                        width: 150
                    }, {
                        text: 'Vel. Reg.',
                        field: 'velocidade',
                        width: 150
                    }, {
                        text: 'Diff. Vel.',
                        field: 'diferencaVel',
                        width: 150
                    }, {
                        text: 'Latitude',
                        field: 'latitude',
                        width: 150
                    }, {
                        text: 'Longitude',
                        field: 'longitude',
                        width: 150
                    }
                ]
            });
        },

        buscar: function() {
            Cmp.showLoading();

            Cmp.request({
                url: 'index.php?mdl=relVeiculoAcimaVel&file=ds_veiculoacimavel.php',
                params: {
                    placa: Cmp.get('inputPlaca').getValue()
                },
                success: function(res) {
                    Cmp.hideLoading();
                    if(res.status == 'success') {
                        Cmp.get('gridDadosRelVeiculoAcimaVel').loadData(res.data);
                    } else {
                        Cmp.showErrorMessage(res.message || 'Ocorreu um erro na requisição');
                    }
                }
            });
        }

    };

    this.init = function() {
        private.render();
        Cmp.request({
            url: 'index.php?mdl=relVeiculoAcimaVel&file=ds_veiculoacimavel.php',
            success: function(res) {
                Cmp.hideLoading();
                if(res.status == 'success') {
                    Cmp.get('gridDadosRelVeiculoAcimaVel').loadData(res.data);
                } else {
                    Cmp.showErrorMessage(res.message || 'Ocorreu um erro na requisição');
                }
            }
        });
    }

}