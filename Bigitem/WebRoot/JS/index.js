FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chars3',
        width: '1345',
        height: '320',
        dataFormat: 'jsonurl',
        dataSource: 'http://localhost:8080/Bigitem/Nry.do?method=getZBXMQK',
    });
    revenueChart.render();
});
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chars1',
        width: '380',
        height: '230',
        dataFormat: 'jsonurl',
        dataSource: 'http://localhost:8080/Bigitem/Nry.do?method=getXMTZFW',
    }).render();    
});
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chars2',
        width: '380',
        height: '230',
        dataFormat: 'jsonurl',
        dataSource: 'http://localhost:8080/Bigitem/Nry.do?method=getDQXMSL',
    }).render();    
});