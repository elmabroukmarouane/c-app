
function drawChart(id_personne, year)
{
    var array_total_value = [];
    Array.prototype.max = function() {
        return Math.max.apply(null, this);
    };
    Array.prototype.min = function() {
        return Math.min.apply(null, this);
    };
    $.ajax({
        url: 'getTotalSponsored/' + id_personne + '/' + year,
        type: 'GET',
        success: function (response) {
            $.each(response.data_get_total_sponsored.draw_chart, function(key, value) {
                array_total_value.push(value);
            });
            var ctx = document.getElementById("myChart").getContext('2d');
            var data = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dem'],
                datasets: [
                    {
                        label: ['Total of sponsored person'],
                        backgroundColor: "rgba(54, 162, 235, 0.4)",
                        borderColor: "rgba(54, 162, 235, 1)",
                        borderWidth: 2,
                        hoverBackgroundColor: 'rgba(54, 162, 235, 0.5)',
                        hoverBorderColor: 'rgba(54, 162, 235, 0.8)',
                        data: array_total_value
                    }
                ]
            };
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: data,
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Number of sponsored person by month'
                    },
                    animation: {
                        animateScale: true
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true,
                                callback: function (value) { if (Number.isInteger(value)) { return value; } },
                                stepSize: 1
                            }
                        }]
                    }
                }
            });
        }
    });
}