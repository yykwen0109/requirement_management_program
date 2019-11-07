/**
 * Resize function without multiple trigger
 * 
 * Usage:
 * $(window).smartresize(function(){  
 *     // code here
 * });
 */
(function($,sr){
	// debouncing function from John Hann
	// http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
	var debounce = function (func, threshold, execAsap) {
		var timeout;

		return function debounced () {
			var obj = this, args = arguments;
			function delayed () {
				if (!execAsap)
					func.apply(obj, args); 
				timeout = null; 
			}

			if (timeout)
				clearTimeout(timeout);
			else if (execAsap)
				func.apply(obj, args);

			timeout = setTimeout(delayed, threshold || 100); 
		};
	};

	// smartresize 
	jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
$BODY = $('body'),
$MENU_TOGGLE = $('#menu_toggle'),
$SIDEBAR_MENU = $('#sidebar-menu'),
$SIDEBAR_FOOTER = $('.sidebar-footer'),
$LEFT_COL = $('.left_col'),
$RIGHT_COL = $('.right_col'),
$NAV_MENU = $('.nav_menu'),
$FOOTER = $('footer');



//Sidebar
function init_sidebar() {
//	TODO: This is some kind of easy fix, maybe we can improve this
	var setContentHeight = function () {
		// reset height
		$RIGHT_COL.css('min-height', $(window).height());

		var bodyHeight = $BODY.outerHeight(),
		footerHeight = $BODY.hasClass('footer_fixed') ? -10 : $FOOTER.height(),
				leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
				contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;

		// normalize content
		contentHeight -= $NAV_MENU.height() + footerHeight;

		$RIGHT_COL.css('min-height', contentHeight);
	};

	$SIDEBAR_MENU.find('a').on('click', function(ev) {
		console.log('clicked - sidebar_menu');
		var $li = $(this).parent();

		if ($li.is('.active')) {
			$li.removeClass('active active-sm');
			$('ul:first', $li).slideUp(function() {
				setContentHeight();
			});
		} else {
			// prevent closing menu if we are on child menu
			if (!$li.parent().is('.child_menu')) {
				$SIDEBAR_MENU.find('li').removeClass('active active-sm');
				$SIDEBAR_MENU.find('li ul').slideUp();
			}else
			{
				if ( $BODY.is( ".nav-sm" ) )
				{
					$li.parent().find( "li" ).removeClass( "active active-sm" );
					$li.parent().find( "li ul" ).slideUp();
				}
			}
			$li.addClass('active');

			$('ul:first', $li).slideDown(function() {
				setContentHeight();
			});
		}
	});

//	toggle small or large menu 
	$MENU_TOGGLE.on('click', function() {
		console.log('clicked - menu toggle');

		if ($BODY.hasClass('nav-md')) {
			$SIDEBAR_MENU.find('li.active ul').hide();
			$SIDEBAR_MENU.find('li.active').addClass('active-sm').removeClass('active');
		} else {
			$SIDEBAR_MENU.find('li.active-sm ul').show();
			$SIDEBAR_MENU.find('li.active-sm').addClass('active').removeClass('active-sm');
		}

		$BODY.toggleClass('nav-md nav-sm');

		setContentHeight();

		$('.dataTable').each ( function () { $(this).dataTable().fnDraw(); });
	});

	// check active menu
	$SIDEBAR_MENU.find('a[href="' + CURRENT_URL + '"]').parent('li').addClass('current-page');

	$SIDEBAR_MENU.find('a').filter(function () {
		return this.href == CURRENT_URL;
	}).parent('li').addClass('current-page').parents('ul').slideDown(function() {
		setContentHeight();
	}).parent().addClass('active');

	// recompute content when resizing
	$(window).smartresize(function(){  
		setContentHeight();
	});

	setContentHeight();

	// fixed sidebar
	if ($.fn.mCustomScrollbar) {
		$('.menu_fixed').mCustomScrollbar({
			autoHideScrollbar: true,
			theme: 'minimal',
			mouseWheel:{ preventDefault: true }
		});
	}
};
///Sidebar

var randNum = function() {
	return (Math.floor(Math.random() * (1 + 40 - 20))) + 20;
};


//Panel toolbox
$(document).ready(function() {
	$('.collapse-link').on('click', function() {
		var $BOX_PANEL = $(this).closest('.x_panel'),
		$ICON = $(this).find('i'),
		$BOX_CONTENT = $BOX_PANEL.find('.x_content');

		// fix for some div with hardcoded fix class
		if ($BOX_PANEL.attr('style')) {
			$BOX_CONTENT.slideToggle(200, function(){
				$BOX_PANEL.removeAttr('style');
			});
		} else {
			$BOX_CONTENT.slideToggle(200); 
			$BOX_PANEL.css('height', 'auto');  
		}

		$ICON.toggleClass('fa-chevron-up fa-chevron-down');
	});

	$('.close-link').click(function () {
		var $BOX_PANEL = $(this).closest('.x_panel');

		$BOX_PANEL.remove();
	});
	$('.table-link').click(function () {

		var $CHART_PANEL = $(this).closest('.x_panel').find('.chart-content');
		var $TABLE_PANEL = $(this).closest('.x_panel').find('.table-content');

		$CHART_PANEL.css('display','none')
		$TABLE_PANEL.css('display','block')
	});
	$('.chart-link').click(function () {
		var $CHART_PANEL = $(this).closest('.x_panel').find('.chart-content');
		var $TABLE_PANEL = $(this).closest('.x_panel').find('.table-content');

		$CHART_PANEL.css('display','block')
		$TABLE_PANEL.css('display','none')
	});
});
///Panel toolbox

//Tooltip
$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip({
		container: 'body'
	});
});
///Tooltip

//Progressbar
if ($(".progress .progress-bar")[0]) {
	$('.progress .progress-bar').progressbar();
}
///Progressbar

//Switchery
$(document).ready(function() {
	if ($(".js-switch")[0]) {
		var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
		elems.forEach(function (html) {
			var switchery = new Switchery(html, {
				color: '#26B99A'
			});
		});
	}
});
///Switchery


//iCheck
$(document).ready(function() {
	if ($("input.flat")[0]) {
		$(document).ready(function () {
			$('input.flat').iCheck({
				checkboxClass: 'icheckbox_flat-green',
				radioClass: 'iradio_flat-green'
			});
		});
	}
});
///iCheck

//Table
$('table input').on('ifChecked', function () {
	checkState = '';
	$(this).parent().parent().parent().addClass('selected');
	countChecked();
});
$('table input').on('ifUnchecked', function () {
	checkState = '';
	$(this).parent().parent().parent().removeClass('selected');
	countChecked();
});

var checkState = '';

$('.bulk_action input').on('ifChecked', function () {
	checkState = '';
	$(this).parent().parent().parent().addClass('selected');
	countChecked();
});
$('.bulk_action input').on('ifUnchecked', function () {
	checkState = '';
	$(this).parent().parent().parent().removeClass('selected');
	countChecked();
});
$('.bulk_action input#check-all').on('ifChecked', function () {
	checkState = 'all';
	countChecked();
});
$('.bulk_action input#check-all').on('ifUnchecked', function () {
	checkState = 'none';
	countChecked();
});

function countChecked() {
	if (checkState === 'all') {
		$(".bulk_action input[name='table_records']").iCheck('check');
	}
	if (checkState === 'none') {
		$(".bulk_action input[name='table_records']").iCheck('uncheck');
	}

	var checkCount = $(".bulk_action input[name='table_records']:checked").length;

	if (checkCount) {
		$('.column-title').hide();
		$('.bulk-actions').show();
		$('.action-cnt').html(checkCount + ' Records Selected');
	} else {
		$('.column-title').show();
		$('.bulk-actions').hide();
	}
}



//Accordion
$(document).ready(function() {
	$(".expand").on("click", function () {
		$(this).next().slideToggle(200);
		$expand = $(this).find(">:first-child");

		if ($expand.text() == "+") {
			$expand.text("-");
		} else {
			$expand.text("+");
		}
	});
});

//NProgress
if (typeof NProgress != 'undefined') {
	$(document).ready(function () {
		NProgress.start();
	});

	$(window).load(function () {
		NProgress.done();
	});
}


//hover and retain popover when on popover content
var originalLeave = $.fn.popover.Constructor.prototype.leave;
$.fn.popover.Constructor.prototype.leave = function(obj) {
	var self = obj instanceof this.constructor ?
			obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type);
	var container, timeout;

	originalLeave.call(this, obj);

	if (obj.currentTarget) {
		container = $(obj.currentTarget).siblings('.popover');
		timeout = self.timeout;
		container.one('mouseenter', function() {
			//We entered the actual popover – call off the dogs
			clearTimeout(timeout);
			//Let's monitor popover content instead
			container.one('mouseleave', function() {
				$.fn.popover.Constructor.prototype.leave.call(self, self);
			});
		});
	}
};

$('body').popover({
	selector: '[data-popover]',
	trigger: 'click hover',
	delay: {
		show: 50,
		hide: 400
	}
});


function gd(year, month, day) {
	return new Date(year, month - 1, day).getTime();
}


function getFormatDate(date){ 
	var year = date.getFullYear();	//yyyy 
	var month = (1 + date.getMonth());	//M 
	var day = date.getDate();	//d  
	return year + '-' + month + '-' + day;
}




function init_flot_chart(){

	if( typeof ($.plot) === 'undefined'){ return; }

	console.log('init_flot_chart');

	
	/*분기 별 그래프*/
	var project_per_days_quarter = new Array();
	var dic ={}
	for(var i =0 ; i<$(".quarter_project_table_day").size();i++){
		dic[$(".quarter_project_table_day").eq(i).text()] = $(".quarter_project_table_count").eq(i).text();
	}
	
	var current_date = new Date();
	var quarter = getQuarter(current_date.getFullYear(),current_date);
	var date_diff =dateDiff(quarter[1],quarter[2]);
	
	var date_start = new Date(quarter[1])
	date_start.add(-1).days()
	for (var i = 0; i <=date_diff; i++) {
		var temp = new Array();
		var day_temp =getFormatDate(date_start.add(1).days())
		if(day_temp in dic){
			temp.push(gd(day_temp.split('-')[0],day_temp.split('-')[1],day_temp.split('-')[2]), dic[day_temp]);
		}
		else
			temp.push(gd(day_temp.split('-')[0],day_temp.split('-')[1],day_temp.split('-')[2]),0);	
		project_per_days_quarter.push(temp);
	}



	var arr_data1 =project_per_days_quarter;

	
	
	
	
	
	var csr_per_days_quarter = new Array();
	var dic_csr ={}
	for(var i =0 ; i<$(".quarter_CSR_table_day").size();i++){
		dic_csr[$(".quarter_CSR_table_day").eq(i).text()] = $(".quarter_CSR_table_count").eq(i).text()
	}
	date_start = new Date(quarter[1])
	date_start.add(-1).days()

	for (var i = 0; i <90; i++) {
		var temp = new Array();
		var day_temp =getFormatDate(date_start.add(1).days())

		if(day_temp in dic_csr){
			temp.push(gd(day_temp.split('-')[0],day_temp.split('-')[1],day_temp.split('-')[2]), dic_csr[day_temp]);
		}
		else
			temp.push(gd(day_temp.split('-')[0],day_temp.split('-')[1],day_temp.split('-')[2]),0);	
		csr_per_days_quarter.push(temp);
	}


	var arr_data1_1 =csr_per_days_quarter;

	var arr_data3 = [
		[0, 1],
		[1, 9],
		[2, 6],
		[3, 10],
		[4, 5],
		[5, 17],
		[6, 6],
		[7, 10],
		[8, 7],
		[9, 11],
		[10, 35],
		[11, 9],
		[12, 12],
		[13, 5],
		[14, 3],
		[15, 4],
		[16, 9]
		];

	var chart_plot_02_data = [];
	var dic ={};
	for(var i =0 ; i<$(".project_per_days_day").size();i++){
		dic[$(".project_per_days_day").eq(i).text()] = $(".project_per_days_count").eq(i).text();
	}

	for (var i = -30; i < 0; i++) {

		if(getFormatDate(new Date(Date.today().add(i).days())) in dic){
			chart_plot_02_data.push([new Date(Date.today().add(i).days()).getTime(), dic[getFormatDate(new Date(Date.today().add(i).days()))]]);}
		else
			chart_plot_02_data.push([new Date(Date.today().add(i).days()).getTime(),0]);	
	}
	
	var CSR_register_data = [];
	var CSR_register = new Array();
	var dic_csr ={};
	for(var i =0 ; i<$(".csr_per_days_day").size();i++){
		dic_csr[$(".csr_per_days_day").eq(i).text()] = $(".csr_per_days_count").eq(i).text();
	}

	for (var i = -30; i < 0; i++) {
		if(getFormatDate(new Date(Date.today().add(i).days())) in dic_csr){
			CSR_register_data.push([new Date(Date.today().add(i).days()).getTime(), dic_csr[getFormatDate(new Date(Date.today().add(i).days()))]]);}
		else
			CSR_register_data.push([new Date(Date.today().add(i).days()).getTime(),0]);	
	}


	var chart_plot_01_settings = {
			series: {
				splines: {
					show: true,
					tension: 0.2,
					lineWidth: 1,
					fill: 0.4
				},
				points: {
					radius: 0,
					show: true
				},
				shadowSize: 2
			},
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			colors: ["rgba(0,159,220,0.7)", "rgba(65,186,231,0.7)"],
			xaxis: {
				tickColor: "rgba(51, 51, 51, 0.06)",
				mode: "time",
				tickSize: [1, "month"],
				//tickLength: 10,
				axisLabel: "Date",
				axisLabelUseCanvas: true,
				axisLabelFontSizePixels: 12,
				axisLabelFontFamily: 'Verdana, Arial',
				axisLabelPadding: 10
			},
			yaxis: {
				min: 0,
				ticks: 1,
				tickSize:1,
				tickColor: "rgba(51, 51, 51, 0.06)",
			},
			tooltip: true
	}

	var chart_plot_01_settings_1 = {
			series: {
				splines: {
					show: true,
					tension: 0.2,
					lineWidth: 1,
					fill: 0.4
				},
				points: {
					radius: 0,
					show: true
				},
				shadowSize: 2
			},
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			colors: ["rgba(0,159,220,0.7)", "rgba(65,186,231,0.7)"],
			xaxis: {
				tickColor: "rgba(51, 51, 51, 0.06)",
				mode: "time",
				tickSize: [1, "month"],
				//tickLength: 10,
				axisLabel: "Date",
				axisLabelUseCanvas: true,
				axisLabelFontSizePixels: 12,
				axisLabelFontFamily: 'Verdana, Arial',
				axisLabelPadding: 10
			},
			yaxis: {
				min: 0,
				ticks: 30,
				tickSize:30,
				tickColor: "rgba(51, 51, 51, 0.06)",
			},
			tooltip: true
	}
	var chart_plot_02_settings = {
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			series: {
				lines: {
					show: true,
					fill: true,
					lineWidth: 2,
					steps: false
				},
				points: {
					show: false,
					radius:3,
					symbol: "circle",
					lineWidth: 3.0
				}
			},
			legend: {
				position: "ne",
				margin: [0, -25],
				noColumns: 0,
				labelBoxBorderColor: null,
				labelFormatter: function(label, series) {
					return label + '&nbsp;&nbsp;';
				},
				width: 40,
				height: 1
			},
			colors: ['#1d8de5', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'],
			shadowSize: 0,
			tooltip: true,
			tooltipOpts: {
				content: "%s: %y.0",
				xDateFormat: "%d/%m",
				shifts: {
					x: -30,
					y: -50
				},
				defaultTheme: false
			},
			yaxis: {
				min: 0,
				tick:1,
				tickSize:1
			},
			xaxis: {
				mode: "time",
				minTickSize: [1, "day"],
				timeformat: "%y-%m-%d",
				
			}
	};	
	var chart_plot_02_settings_1 = {
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			series: {
				lines: {
					show: true,
					fill: true,
					lineWidth: 2,
					steps: false
				},
				points: {
					show: false,
					radius: 3,
					symbol: "circle",
					lineWidth: 3.0
				}
			},
			legend: {
				position: "ne",
				margin: [0, -25],
				noColumns: 0,
				labelBoxBorderColor: null,
				labelFormatter: function(label, series) {
					return label + '&nbsp;&nbsp;';
				},
				width: 40,
				height: 1
			},
			colors: ['#1d8de5', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'],
			shadowSize: 0,
			tooltip: true,
			tooltipOpts: {
				content: "%s: %y.0",
				xDateFormat: "%d/%m",
				shifts: {
					x: -30,
					y: -50
				},
				defaultTheme: false
			},
			yaxis: {
				min: 0,
				tick:10,
				tickSize:30
			},
			xaxis: {
				mode: "time",
				minTickSize: [1, "day"],
				timeformat: "%y-%m-%d",
		
			}
	};	




	if ($("#chart_plot_01").length){
		console.log('Plot1');

		$.plot( $("#chart_plot_01"), [{ label:"프로젝트 신청 수",data:arr_data1}],  chart_plot_01_settings );
		$('#chart_plot_01').UseTooltip();
	}
	if ($("#CSR_per_quarter").length){
		console.log('Plot1');

		$.plot( $("#CSR_per_quarter"), [{ label:"CSR 신청 수",data:arr_data1_1}],  chart_plot_01_settings_1 );
		$('#CSR_per_quarter').UseTooltip();
	}


	if ($("#chart_plot_02").length){
		console.log('Plot2 :'+$("#chart_plot_02").length);

		$.plot( $("#chart_plot_02"), 
				[{ 
					label: "프로젝트 신청 수", 
					data: chart_plot_02_data, 
					lines: { 
						fillColor: "rgba(29,141,229, 0.12)" 
					}, 
					points: { 
						fillColor: "#fff" } 
				}], chart_plot_02_settings);
		$('#chart_plot_02').UseTooltip();

	}
	if ($("#CSR_per_month").length){
		console.log('Plot2 :'+$("#CSR_per_month").length);

		$.plot( $("#CSR_per_month"), 
				[{ 
					label: "CSR 신청 수", 
					data: CSR_register_data, 
					lines: { 
						fillColor: "rgba(29,141,229, 0.12)" 
					}, 
					points: { 
						fillColor: "#fff" } 
				}], chart_plot_02_settings_1);
		$('#CSR_per_month').UseTooltip();

	}



} 
$.fn.UseTooltip = function () {
	var previousPoint = null;

	$(this).bind("plothover", function (event, pos, item) {         
		if (item) {
			if (previousPoint != item.dataIndex) {
				previousPoint = item.dataIndex;

				$("#tooltip").remove();

				var x = item.datapoint[0];
				var y = item.datapoint[1];                

				showTooltip(item.pageX, item.pageY,
						(new Date(x)).format("y년 m월 d일")+"<br/>" + "<strong>"+item.series.label +" : " + y + "</strong> ");
			}
		}
		else {
			$("#tooltip").remove();
			previousPoint = null;
		}
	});
};

function showTooltip(x, y, contents) {
	$('<div id="tooltip">' + contents + '</div>').css({
		position: 'absolute',
		display: 'none',
		top: y + 5,
		left: x + 20,
		border: '2px solid #4572A7',
		padding: '2px',     
		size: '10',   
		'background-color': '#fff',
		opacity: 0.80
	}).appendTo("body").fadeIn(200);
}


/* STARRR */

function init_starrr() {

	if( typeof (starrr) === 'undefined'){ return; }
	console.log('init_starrr');

	$(".stars").starrr();

	$('.stars-existing').starrr({
		rating: 4
	});

	$('.stars').on('starrr:change', function (e, value) {
		$('.stars-count').html(value);
	});

	$('.stars-existing').on('starrr:change', function (e, value) {
		$('.stars-count-existing').html(value);
	});

};


function init_JQVmap(){

	//console.log('check init_JQVmap [' + typeof (VectorCanvas) + '][' + typeof (jQuery.fn.vectorMap) + ']' );	

	if(typeof (jQuery.fn.vectorMap) === 'undefined'){ return; }

	console.log('init_JQVmap');

	if ($('#world-map-gdp').length ){

		$('#world-map-gdp').vectorMap({
			map: 'world_en',
			backgroundColor: null,
			color: '#ffffff',
			hoverOpacity: 0.7,
			selectedColor: '#666666',
			enableZoom: true,
			showTooltip: true,
			values: sample_data,
			scaleColors: ['#E6F2F0', '#149B7E'],
			normalizeFunction: 'polynomial'
		});

	}

	if ($('#usa_map').length ){

		$('#usa_map').vectorMap({
			map: 'usa_en',
			backgroundColor: null,
			color: '#ffffff',
			hoverOpacity: 0.7,
			selectedColor: '#666666',
			enableZoom: true,
			showTooltip: true,
			values: sample_data,
			scaleColors: ['#E6F2F0', '#149B7E'],
			normalizeFunction: 'polynomial'
		});

	}

};


function init_skycons(){

	if( typeof (Skycons) === 'undefined'){ return; }
	console.log('init_skycons');

	var icons = new Skycons({
		"color": "#73879C"
	}),
	list = [
		"clear-day", "clear-night", "partly-cloudy-day",
		"partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
		"fog"
		],
		i;

	for (i = list.length; i--;)
		icons.set(list[i], list[i]);

	icons.play();

}  
var data_1;

function init_chart_doughnut(){

	if( typeof (Chart) === 'undefined'){ return; }

	console.log('init_chart_doughnut');

	if ($('.CSR_per_project').length){
		var project_name = new Array();
		var csr_count = new Array();
		var color_array = new Array();
		var csr_data = []
	//색 뽑는 배열 하나 둬야됨
	var max_length =10;
	if(max_length>$(".csr_per_project_name").size()) max_length =$(".csr_per_project_name").size();
	
		for(var i =0 ; i<max_length ;i++){
			project_name.push($(".csr_per_project_name").eq(i).text())
			csr_count.push($(".csr_per_project_count").eq(i).text())
			var color = 'rgba('+Math.floor(Math.random()*180)+','+Math.floor(Math.random()*180)+',230'+Math.floor(Math.random()*1,2)+')';
			color_array.push(color);
			var dic = {};
			dic["value"] = $(".csr_per_project_count").eq(i).text();
			dic["name"] = $(".csr_per_project_name").eq(i).text();
			csr_data[i]=(dic);
		}
		data1= csr_data;
		var chart_doughnut_settings = {
				type: 'doughnut',
				tooltipFillColor: "rgba(51, 51, 51, 0.55)",
				data: {
					labels: project_name,
					datasets: [{
						data: csr_count,
						backgroundColor: color_array

					}]
				},
				options: { 
					legend: false, 
					responsive: false 
				}
		}

		$('.CSR_per_project').each(function(){

			var chart_element = $(this);
			var chart_doughnut = new Chart( chart_element, chart_doughnut_settings);

		});			

	}  
	if ($('.CSR_per_person').length){
		var project_name = new Array();
		var csr_count = new Array();
		var color_array = new Array();
		var csr_data = []
		var max_length =10;
		if(max_length>$(".csr_per_person_name").size()) max_length =$(".csr_per_person_name").size();
	
		for(var i =0 ; i<max_length ;i++){


			project_name.push($(".csr_per_person_name").eq(i).text())
			csr_count.push($(".csr_per_person_count").eq(i).text());
			var color = 'rgb('+Math.floor(Math.random()*255)+','+Math.floor(Math.random()*255)+',255)';
			color_array.push(color);
			var dic = {};
			dic["value"] = $(".csr_per_person_count").eq(i).text();
			dic["name"] = $(".csr_per_person_name").eq(i).text();
			csr_data[i]=(dic);
		}

		var chart_doughnut_settings = {
				type: 'doughnut',
				tooltipFillColor: "rgba(51, 51, 51, 0.55)",
				data: {
					labels: project_name,
					datasets: [{
						data: csr_count,
						backgroundColor: color_array

					}]
				},
				options: { 
					legend: false, 
					responsive: false 
				}
		}

		$('.CSR_per_person').each(function(){

			var chart_element = $(this);
			var chart_doughnut = new Chart( chart_element, chart_doughnut_settings);

		});			

	}  

}




/* AUTOCOMPLETE */

function init_autocomplete() {

	if( typeof ($.fn.autocomplete) === 'undefined'){ return; }
	console.log('init_autocomplete');

	var countries = { AD:"Andorra",A2:"Andorra Test",AE:"United Arab Emirates",AF:"Afghanistan",AG:"Antigua and Barbuda",AI:"Anguilla",AL:"Albania",AM:"Armenia",AN:"Netherlands Antilles",AO:"Angola",AQ:"Antarctica",AR:"Argentina",AS:"American Samoa",AT:"Austria",AU:"Australia",AW:"Aruba",AX:"Åland Islands",AZ:"Azerbaijan",BA:"Bosnia and Herzegovina",BB:"Barbados",BD:"Bangladesh",BE:"Belgium",BF:"Burkina Faso",BG:"Bulgaria",BH:"Bahrain",BI:"Burundi",BJ:"Benin",BL:"Saint Barthélemy",BM:"Bermuda",BN:"Brunei",BO:"Bolivia",BQ:"British Antarctic Territory",BR:"Brazil",BS:"Bahamas",BT:"Bhutan",BV:"Bouvet Island",BW:"Botswana",BY:"Belarus",BZ:"Belize",CA:"Canada",CC:"Cocos [Keeling] Islands",CD:"Congo - Kinshasa",CF:"Central African Republic",CG:"Congo - Brazzaville",CH:"Switzerland",CI:"Côte d’Ivoire",CK:"Cook Islands",CL:"Chile",CM:"Cameroon",CN:"China",CO:"Colombia",CR:"Costa Rica",CS:"Serbia and Montenegro",CT:"Canton and Enderbury Islands",CU:"Cuba",CV:"Cape Verde",CX:"Christmas Island",CY:"Cyprus",CZ:"Czech Republic",DD:"East Germany",DE:"Germany",DJ:"Djibouti",DK:"Denmark",DM:"Dominica",DO:"Dominican Republic",DZ:"Algeria",EC:"Ecuador",EE:"Estonia",EG:"Egypt",EH:"Western Sahara",ER:"Eritrea",ES:"Spain",ET:"Ethiopia",FI:"Finland",FJ:"Fiji",FK:"Falkland Islands",FM:"Micronesia",FO:"Faroe Islands",FQ:"French Southern and Antarctic Territories",FR:"France",FX:"Metropolitan France",GA:"Gabon",GB:"United Kingdom",GD:"Grenada",GE:"Georgia",GF:"French Guiana",GG:"Guernsey",GH:"Ghana",GI:"Gibraltar",GL:"Greenland",GM:"Gambia",GN:"Guinea",GP:"Guadeloupe",GQ:"Equatorial Guinea",GR:"Greece",GS:"South Georgia and the South Sandwich Islands",GT:"Guatemala",GU:"Guam",GW:"Guinea-Bissau",GY:"Guyana",HK:"Hong Kong SAR China",HM:"Heard Island and McDonald Islands",HN:"Honduras",HR:"Croatia",HT:"Haiti",HU:"Hungary",ID:"Indonesia",IE:"Ireland",IL:"Israel",IM:"Isle of Man",IN:"India",IO:"British Indian Ocean Territory",IQ:"Iraq",IR:"Iran",IS:"Iceland",IT:"Italy",JE:"Jersey",JM:"Jamaica",JO:"Jordan",JP:"Japan",JT:"Johnston Island",KE:"Kenya",KG:"Kyrgyzstan",KH:"Cambodia",KI:"Kiribati",KM:"Comoros",KN:"Saint Kitts and Nevis",KP:"North Korea",KR:"South Korea",KW:"Kuwait",KY:"Cayman Islands",KZ:"Kazakhstan",LA:"Laos",LB:"Lebanon",LC:"Saint Lucia",LI:"Liechtenstein",LK:"Sri Lanka",LR:"Liberia",LS:"Lesotho",LT:"Lithuania",LU:"Luxembourg",LV:"Latvia",LY:"Libya",MA:"Morocco",MC:"Monaco",MD:"Moldova",ME:"Montenegro",MF:"Saint Martin",MG:"Madagascar",MH:"Marshall Islands",MI:"Midway Islands",MK:"Macedonia",ML:"Mali",MM:"Myanmar [Burma]",MN:"Mongolia",MO:"Macau SAR China",MP:"Northern Mariana Islands",MQ:"Martinique",MR:"Mauritania",MS:"Montserrat",MT:"Malta",MU:"Mauritius",MV:"Maldives",MW:"Malawi",MX:"Mexico",MY:"Malaysia",MZ:"Mozambique",NA:"Namibia",NC:"New Caledonia",NE:"Niger",NF:"Norfolk Island",NG:"Nigeria",NI:"Nicaragua",NL:"Netherlands",NO:"Norway",NP:"Nepal",NQ:"Dronning Maud Land",NR:"Nauru",NT:"Neutral Zone",NU:"Niue",NZ:"New Zealand",OM:"Oman",PA:"Panama",PC:"Pacific Islands Trust Territory",PE:"Peru",PF:"French Polynesia",PG:"Papua New Guinea",PH:"Philippines",PK:"Pakistan",PL:"Poland",PM:"Saint Pierre and Miquelon",PN:"Pitcairn Islands",PR:"Puerto Rico",PS:"Palestinian Territories",PT:"Portugal",PU:"U.S. Miscellaneous Pacific Islands",PW:"Palau",PY:"Paraguay",PZ:"Panama Canal Zone",QA:"Qatar",RE:"Réunion",RO:"Romania",RS:"Serbia",RU:"Russia",RW:"Rwanda",SA:"Saudi Arabia",SB:"Solomon Islands",SC:"Seychelles",SD:"Sudan",SE:"Sweden",SG:"Singapore",SH:"Saint Helena",SI:"Slovenia",SJ:"Svalbard and Jan Mayen",SK:"Slovakia",SL:"Sierra Leone",SM:"San Marino",SN:"Senegal",SO:"Somalia",SR:"Suriname",ST:"São Tomé and Príncipe",SU:"Union of Soviet Socialist Republics",SV:"El Salvador",SY:"Syria",SZ:"Swaziland",TC:"Turks and Caicos Islands",TD:"Chad",TF:"French Southern Territories",TG:"Togo",TH:"Thailand",TJ:"Tajikistan",TK:"Tokelau",TL:"Timor-Leste",TM:"Turkmenistan",TN:"Tunisia",TO:"Tonga",TR:"Turkey",TT:"Trinidad and Tobago",TV:"Tuvalu",TW:"Taiwan",TZ:"Tanzania",UA:"Ukraine",UG:"Uganda",UM:"U.S. Minor Outlying Islands",US:"United States",UY:"Uruguay",UZ:"Uzbekistan",VA:"Vatican City",VC:"Saint Vincent and the Grenadines",VD:"North Vietnam",VE:"Venezuela",VG:"British Virgin Islands",VI:"U.S. Virgin Islands",VN:"Vietnam",VU:"Vanuatu",WF:"Wallis and Futuna",WK:"Wake Island",WS:"Samoa",YD:"People's Democratic Republic of Yemen",YE:"Yemen",YT:"Mayotte",ZA:"South Africa",ZM:"Zambia",ZW:"Zimbabwe",ZZ:"Unknown or Invalid Region" };

	var countriesArray = $.map(countries, function(value, key) {
		return {
			value: value,
			data: key
		};
	});

	// initialize autocomplete with custom appendTo
	$('#autocomplete-custom-append').autocomplete({
		lookup: countriesArray
	});

};

/* AUTOSIZE */

function init_autosize() {

	if(typeof $.fn.autosize !== 'undefined'){

		autosize($('.resizable_textarea'));

	}

};  

/* PARSLEY */

function init_parsley() {

	if( typeof (parsley) === 'undefined'){ return; }
	console.log('init_parsley');

	$/*.listen*/('parsley:field:validate', function() {
		validateFront();
	});
	$('#demo-form .btn').on('click', function() {
		$('#demo-form').parsley().validate();
		validateFront();
	});
	var validateFront = function() {
		if (true === $('#demo-form').parsley().isValid()) {
			$('.bs-callout-info').removeClass('hidden');
			$('.bs-callout-warning').addClass('hidden');
		} else {
			$('.bs-callout-info').addClass('hidden');
			$('.bs-callout-warning').removeClass('hidden');
		}
	};

	$/*.listen*/('parsley:field:validate', function() {
		validateFront();
	});
	$('#demo-form2 .btn').on('click', function() {
		$('#demo-form2').parsley().validate();
		validateFront();
	});
	var validateFront = function() {
		if (true === $('#demo-form2').parsley().isValid()) {
			$('.bs-callout-info').removeClass('hidden');
			$('.bs-callout-warning').addClass('hidden');
		} else {
			$('.bs-callout-info').addClass('hidden');
			$('.bs-callout-warning').removeClass('hidden');
		}
	};

	try {
		hljs.initHighlightingOnLoad();
	} catch (err) {}

};


/* INPUTS */

function onAddTag(tag) {
	alert("Added a tag: " + tag);
}

function onRemoveTag(tag) {
	alert("Removed a tag: " + tag);
}

function onChangeTag(input, tag) {
	alert("Changed a tag: " + tag);
}

//tags input
function init_TagsInput() {

	if(typeof $.fn.tagsInput !== 'undefined'){	

		$('#tags_1').tagsInput({
			width: 'auto'
		});

	}

};

/* SELECT2 */

function init_select2() {

	if( typeof (select2) === 'undefined'){ return; }
	console.log('init_toolbox');

	$(".select2_single").select2({
		placeholder: "Select a state",
		allowClear: true
	});
	$(".select2_group").select2({});
	$(".select2_multiple").select2({
		maximumSelectionLength: 4,
		placeholder: "With Max Selection limit 4",
		allowClear: true
	});

};

/* WYSIWYG EDITOR */

function init_wysiwyg() {

	if( typeof ($.fn.wysiwyg) === 'undefined'){ return; }
	console.log('init_wysiwyg');	

	function init_ToolbarBootstrapBindings() {
		var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
			'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
			'Times New Roman', 'Verdana'
			],
			fontTarget = $('[title=Font]').siblings('.dropdown-menu');
		$.each(fonts, function(idx, fontName) {
			fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
		});
		$('a[title]').tooltip({
			container: 'body'
		});
		$('.dropdown-menu input').click(function() {
			return false;
		})
		.change(function() {
			$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
		})
		.keydown('esc', function() {
			this.value = '';
			$(this).change();
		});

		$('[data-role=magic-overlay]').each(function() {
			var overlay = $(this),
			target = $(overlay.data('target'));
			overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
		});

		if ("onwebkitspeechchange" in document.createElement("input")) {
			var editorOffset = $('#editor').offset();

			$('.voiceBtn').css('position', 'absolute').offset({
				top: editorOffset.top,
				left: editorOffset.left + $('#editor').innerWidth() - 35
			});
		} else {
			$('.voiceBtn').hide();
		}
	}

	function showErrorAlert(reason, detail) {
		var msg = '';
		if (reason === 'unsupported-file-type') {
			msg = "Unsupported format " + detail;
		} else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
				'<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
	}

	$('.editor-wrapper').each(function(){
		var id = $(this).attr('id');	//editor-one

		$(this).wysiwyg({
			toolbarSelector: '[data-target="#' + id + '"]',
			fileUploadError: showErrorAlert
		});	
	});


	window.prettyPrint;
	prettyPrint();

};

/* CROPPER */

function init_cropper() {


	if( typeof ($.fn.cropper) === 'undefined'){ return; }
	console.log('init_cropper');

	var $image = $('#image');
	var $download = $('#download');
	var $dataX = $('#dataX');
	var $dataY = $('#dataY');
	var $dataHeight = $('#dataHeight');
	var $dataWidth = $('#dataWidth');
	var $dataRotate = $('#dataRotate');
	var $dataScaleX = $('#dataScaleX');
	var $dataScaleY = $('#dataScaleY');
	var options = {
			aspectRatio: 16 / 9,
			preview: '.img-preview',
			crop: function (e) {
				$dataX.val(Math.round(e.x));
				$dataY.val(Math.round(e.y));
				$dataHeight.val(Math.round(e.height));
				$dataWidth.val(Math.round(e.width));
				$dataRotate.val(e.rotate);
				$dataScaleX.val(e.scaleX);
				$dataScaleY.val(e.scaleY);
			}
	};


	// Tooltip
	$('[data-toggle="tooltip"]').tooltip();


	// Cropper
	$image.on({
		'build.cropper': function (e) {
			console.log(e.type);
		},
		'built.cropper': function (e) {
			console.log(e.type);
		},
		'cropstart.cropper': function (e) {
			console.log(e.type, e.action);
		},
		'cropmove.cropper': function (e) {
			console.log(e.type, e.action);
		},
		'cropend.cropper': function (e) {
			console.log(e.type, e.action);
		},
		'crop.cropper': function (e) {
			console.log(e.type, e.x, e.y, e.width, e.height, e.rotate, e.scaleX, e.scaleY);
		},
		'zoom.cropper': function (e) {
			console.log(e.type, e.ratio);
		}
	}).cropper(options);


	// Buttons
	if (!$.isFunction(document.createElement('canvas').getContext)) {
		$('button[data-method="getCroppedCanvas"]').prop('disabled', true);
	}

	if (typeof document.createElement('cropper').style.transition === 'undefined') {
		$('button[data-method="rotate"]').prop('disabled', true);
		$('button[data-method="scale"]').prop('disabled', true);
	}


	// Download
	if (typeof $download[0].download === 'undefined') {
		$download.addClass('disabled');
	}


	// Options
	$('.docs-toggles').on('change', 'input', function () {
		var $this = $(this);
		var name = $this.attr('name');
		var type = $this.prop('type');
		var cropBoxData;
		var canvasData;

		if (!$image.data('cropper')) {
			return;
		}

		if (type === 'checkbox') {
			options[name] = $this.prop('checked');
			cropBoxData = $image.cropper('getCropBoxData');
			canvasData = $image.cropper('getCanvasData');

			options.built = function () {
				$image.cropper('setCropBoxData', cropBoxData);
				$image.cropper('setCanvasData', canvasData);
			};
		} else if (type === 'radio') {
			options[name] = $this.val();
		}

		$image.cropper('destroy').cropper(options);
	});


	// Methods
	$('.docs-buttons').on('click', '[data-method]', function () {
		var $this = $(this);
		var data = $this.data();
		var $target;
		var result;

		if ($this.prop('disabled') || $this.hasClass('disabled')) {
			return;
		}

		if ($image.data('cropper') && data.method) {
			data = $.extend({}, data); // Clone a new one

			if (typeof data.target !== 'undefined') {
				$target = $(data.target);

				if (typeof data.option === 'undefined') {
					try {
						data.option = JSON.parse($target.val());
					} catch (e) {
						console.log(e.message);
					}
				}
			}

			result = $image.cropper(data.method, data.option, data.secondOption);

			switch (data.method) {
			case 'scaleX':
			case 'scaleY':
				$(this).data('option', -data.option);
				break;

			case 'getCroppedCanvas':
				if (result) {

					// Bootstrap's Modal
					$('#getCroppedCanvasModal').modal().find('.modal-body').html(result);

					if (!$download.hasClass('disabled')) {
						$download.attr('href', result.toDataURL());
					}
				}

				break;
			}

			if ($.isPlainObject(result) && $target) {
				try {
					$target.val(JSON.stringify(result));
				} catch (e) {
					console.log(e.message);
				}
			}

		}
	});

	// Keyboard
	$(document.body).on('keydown', function (e) {
		if (!$image.data('cropper') || this.scrollTop > 300) {
			return;
		}

		switch (e.which) {
		case 37:
			e.preventDefault();
			$image.cropper('move', -1, 0);
			break;

		case 38:
			e.preventDefault();
			$image.cropper('move', 0, -1);
			break;

		case 39:
			e.preventDefault();
			$image.cropper('move', 1, 0);
			break;

		case 40:
			e.preventDefault();
			$image.cropper('move', 0, 1);
			break;
		}
	});

	// Import image
	var $inputImage = $('#inputImage');
	var URL = window.URL || window.webkitURL;
	var blobURL;

	if (URL) {
		$inputImage.change(function () {
			var files = this.files;
			var file;

			if (!$image.data('cropper')) {
				return;
			}

			if (files && files.length) {
				file = files[0];

				if (/^image\/\w+$/.test(file.type)) {
					blobURL = URL.createObjectURL(file);
					$image.one('built.cropper', function () {

						// Revoke when load complete
						URL.revokeObjectURL(blobURL);
					}).cropper('reset').cropper('replace', blobURL);
					$inputImage.val('');
				} else {
					window.alert('Please choose an image file.');
				}
			}
		});
	} else {
		$inputImage.prop('disabled', true).parent().addClass('disabled');
	}


};

/* CROPPER --- end */  

/* KNOB */

function init_knob() {

	if( typeof ($.fn.knob) === 'undefined'){ return; }
	console.log('init_knob');

	$(".knob").knob({
		change: function(value) {
			//console.log("change : " + value);
		},
		release: function(value) {
			//console.log(this.$.attr('value'));
			console.log("release : " + value);
		},
		cancel: function() {
			console.log("cancel : ", this);
		},
		/*format : function (value) {
				   return value + '%';
				   },*/
		draw: function() {

			// "tron" case
			if (this.$.data('skin') == 'tron') {

				this.cursorExt = 0.3;

				var a = this.arc(this.cv) // Arc
				,
				pa // Previous arc
				, r = 1;

				this.g.lineWidth = this.lineWidth;

				if (this.o.displayPrevious) {
					pa = this.arc(this.v);
					this.g.beginPath();
					this.g.strokeStyle = this.pColor;
					this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, pa.s, pa.e, pa.d);
					this.g.stroke();
				}

				this.g.beginPath();
				this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
				this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, a.s, a.e, a.d);
				this.g.stroke();

				this.g.lineWidth = 2;
				this.g.beginPath();
				this.g.strokeStyle = this.o.fgColor;
				this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
				this.g.stroke();

				return false;
			}
		}

	});

	// Example of infinite knob, iPod click wheel
	var v, up = 0,
	down = 0,
	i = 0,
	$idir = $("div.idir"),
	$ival = $("div.ival"),
	incr = function() {
		i++;
		$idir.show().html("+").fadeOut();
		$ival.html(i);
	},
	decr = function() {
		i--;
		$idir.show().html("-").fadeOut();
		$ival.html(i);
	};
	$("input.infinite").knob({
		min: 0,
		max: 20,
		stopper: false,
		change: function() {
			if (v > this.cv) {
				if (up) {
					decr();
					up = 0;
				} else {
					up = 1;
					down = 0;
				}
			} else {
				if (v < this.cv) {
					if (down) {
						incr();
						down = 0;
					} else {
						down = 1;
						up = 0;
					}
				}
			}
			v = this.cv;
		}
	});

};

/* INPUT MASK */

function init_InputMask() {

	if( typeof ($.fn.inputmask) === 'undefined'){ return; }
	console.log('init_InputMask');

	$(":input").inputmask();

};



/* DATERANGEPICKER */

function init_daterangepicker() {

	if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
	console.log('init_daterangepicker');

	var cb = function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
		$('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	};

	var optionSet1 = {
			startDate: moment().subtract(29, 'days'),
			endDate: moment(),
			minDate: '01/01/2012',
			maxDate: '12/31/2015',
			dateLimit: {
				days: 60
			},
			showDropdowns: true,
			showWeekNumbers: true,
			timePicker: false,
			timePickerIncrement: 1,
			timePicker12Hour: true,
			ranges: {
				'Today': [moment(), moment()],
				'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				'This Month': [moment().startOf('month'), moment().endOf('month')],
				'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			},
			opens: 'left',
			buttonClasses: ['btn btn-default'],
			applyClass: 'btn-small btn-primary',
			cancelClass: 'btn-small',
			format: 'MM/DD/YYYY',
			separator: ' to ',
			locale: {
				applyLabel: 'Submit',
				cancelLabel: 'Clear',
				fromLabel: 'From',
				toLabel: 'To',
				customRangeLabel: 'Custom',
				daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
				monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				firstDay: 1
			}
	};

	$('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
	$('#reportrange').daterangepicker(optionSet1, cb);
	$('#reportrange').on('show.daterangepicker', function() {
		console.log("show event fired");
	});
	$('#reportrange').on('hide.daterangepicker', function() {
		console.log("hide event fired");
	});
	$('#reportrange').on('apply.daterangepicker', function(ev, picker) {
		console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
	});
	$('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
		console.log("cancel event fired");
	});
	$('#options1').click(function() {
		$('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
	});
	$('#options2').click(function() {
		$('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
	});
	$('#destroy').click(function() {
		$('#reportrange').data('daterangepicker').remove();
	});

}

function init_daterangepicker_right() {

	if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
	console.log('init_daterangepicker_right');

	var cb = function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
		$('#reportrange_right span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	};

	var optionSet1 = {
			startDate: moment().subtract(29, 'days'),
			endDate: moment(),
			minDate: '01/01/2012',
			maxDate: '12/31/2020',
			dateLimit: {
				days: 60
			},
			showDropdowns: true,
			showWeekNumbers: true,
			timePicker: false,
			timePickerIncrement: 1,
			timePicker12Hour: true,
			ranges: {
				'Today': [moment(), moment()],
				'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				'This Month': [moment().startOf('month'), moment().endOf('month')],
				'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			},
			opens: 'right',
			buttonClasses: ['btn btn-default'],
			applyClass: 'btn-small btn-primary',
			cancelClass: 'btn-small',
			format: 'MM/DD/YYYY',
			separator: ' to ',
			locale: {
				applyLabel: 'Submit',
				cancelLabel: 'Clear',
				fromLabel: 'From',
				toLabel: 'To',
				customRangeLabel: 'Custom',
				daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
				monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				firstDay: 1
			}
	};

	$('#reportrange_right span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));

	$('#reportrange_right').daterangepicker(optionSet1, cb);

	$('#reportrange_right').on('show.daterangepicker', function() {
		console.log("show event fired");
	});
	$('#reportrange_right').on('hide.daterangepicker', function() {
		console.log("hide event fired");
	});
	$('#reportrange_right').on('apply.daterangepicker', function(ev, picker) {
		console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
	});
	$('#reportrange_right').on('cancel.daterangepicker', function(ev, picker) {
		console.log("cancel event fired");
	});

	$('#options1').click(function() {
		$('#reportrange_right').data('daterangepicker').setOptions(optionSet1, cb);
	});

	$('#options2').click(function() {
		$('#reportrange_right').data('daterangepicker').setOptions(optionSet2, cb);
	});

	$('#destroy').click(function() {
		$('#reportrange_right').data('daterangepicker').remove();
	});

}

function init_daterangepicker_single_call() {

	if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
	console.log('init_daterangepicker_single_call');

	$('#single_cal1').daterangepicker({
		singleDatePicker: true,
		singleClasses: "picker_1"
	}, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
	});
	$('#single_cal2').daterangepicker({
		singleDatePicker: true,
		singleClasses: "picker_2"
	}, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
	});
	$('#single_cal3').daterangepicker({
		singleDatePicker: true,
		singleClasses: "picker_3"
	}, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
	});
	$('#single_cal4').daterangepicker({
		singleDatePicker: true,
		singleClasses: "picker_4"
	}, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
	});


}


function init_daterangepicker_reservation() {

	if( typeof ($.fn.daterangepicker) === 'undefined'){ return; }
	console.log('init_daterangepicker_reservation');

	$('#reservation').daterangepicker(null, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
	});

	$('#reservation-time').daterangepicker({
		timePicker: true,
		timePickerIncrement: 30,
		locale: {
			format: 'MM/DD/YYYY h:mm A'
		}
	});

}

/* SMART WIZARD */

function init_SmartWizard() {

	if( typeof ($.fn.smartWizard) === 'undefined'){ return; }
	console.log('init_SmartWizard');

	$('#wizard').smartWizard();

	$('#wizard_verticle').smartWizard({
		transitionEffect: 'slide'
	});

	$('.buttonNext').addClass('btn btn-success');
	$('.buttonPrevious').addClass('btn btn-primary');
	$('.buttonFinish').addClass('btn btn-default');

};


/* VALIDATOR */

function init_validator () {

	if( typeof (validator) === 'undefined'){ return; }
	console.log('init_validator'); 

	// initialize the validator function
	validator.message.date = 'not a real date';

	// validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
	$('form')
	.on('blur', 'input[required], input.optional, select.required', validator.checkField)
	.on('change', 'select.required', validator.checkField)
	.on('keypress', 'input[required][pattern]', validator.keypress);

	$('.multi.required').on('keyup blur', 'input', function() {
		validator.checkField.apply($(this).siblings().last()[0]);
	});

	$('form').submit(function(e) {
		e.preventDefault();
		var submit = true;

		// evaluate the form using generic validaing
		if (!validator.checkAll($(this)) || !checkForm()) {
			submit = false;
		}

		if (submit)
			this.submit();

		return false;
	});

};

/* PNotify */

function init_PNotify() {

	if( typeof (PNotify) === 'undefined'){ return; }
	console.log('init_PNotify');
}; 


/* CUSTOM NOTIFICATION */

function init_CustomNotification() {

	console.log('run_customtabs');

	if( typeof (CustomTabs) === 'undefined'){ return; }
	console.log('init_CustomTabs');

	var cnt = 10;

	TabbedNotification = function(options) {
		var message = "<div id='ntf" + cnt + "' class='text alert-" + options.type + "' style='display:none'><h2><i class='fa fa-bell'></i> " + options.title +
		"</h2><div class='close'><a href='javascript:;' class='notification_close'><i class='fa fa-close'></i></a></div><p>" + options.text + "</p></div>";

		if (!document.getElementById('custom_notifications')) {
			alert('doesnt exists');
		} else {
			$('#custom_notifications ul.notifications').append("<li><a id='ntlink" + cnt + "' class='alert-" + options.type + "' href='#ntf" + cnt + "'><i class='fa fa-bell animated shake'></i></a></li>");
			$('#custom_notifications #notif-group').append(message);
			cnt++;
			CustomTabs(options);
		}
	};

	CustomTabs = function(options) {
		$('.tabbed_notifications > div').hide();
		$('.tabbed_notifications > div:first-of-type').show();
		$('#custom_notifications').removeClass('dsp_none');
		$('.notifications a').click(function(e) {
			e.preventDefault();
			var $this = $(this),
			tabbed_notifications = '#' + $this.parents('.notifications').data('tabbed_notifications'),
			others = $this.closest('li').siblings().children('a'),
			target = $this.attr('href');
			others.removeClass('active');
			$this.addClass('active');
			$(tabbed_notifications).children('div').hide();
			$(target).show();
		});
	};

	CustomTabs();

	var tabid = idname = '';

	$(document).on('click', '.notification_close', function(e) {
		idname = $(this).parent().parent().attr("id");
		tabid = idname.substr(-2);
		$('#ntf' + tabid).remove();
		$('#ntlink' + tabid).parent().remove();
		$('.notifications a').first().addClass('active');
		$('#notif-group div').first().css('display', 'block');
	});

};

/* EASYPIECHART */




function init_charts() {

	console.log('run_charts  typeof [' + typeof (Chart) + ']');

	if( typeof (Chart) === 'undefined'){ return; }

	console.log('init_charts');


	Chart.defaults.global.legend = {
			enabled: false
	};


	// Bar chart

	if ($('#mybarChart').length ){ 

		var ctx = document.getElementById("mybarChart");

		var project_name = new Array();
		var csr_name = new Array();
		var injection_time = new Array();
		var max_length =10;
		if(max_length>$(".injection_time_project_name").size()) max_length = $(".injection_time_project_name").size();
		for(var i =0 ; i<max_length;i++){
			project_name.push($(".injection_time_project_name").eq(i).text());
			csr_name.push($(".injection_time_CSR_name").eq(i).text());
			injection_time.push($(".injection_time").eq(i).text())	
		}
		
		var mybarChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels:csr_name,
				datasets: [{
					type : "bar",
					label: '투입 시간',
					backgroundColor: "#009fdc",
					data: injection_time
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});

	} 





}

/* COMPOSE */

function init_compose() {

	if( typeof ($.fn.slideToggle) === 'undefined'){ return; }
	console.log('init_compose');

	$('#compose, .compose-close').click(function(){
		$('.compose').slideToggle();
	});

};



/* DATA TABLES */

function init_DataTables() {

	console.log('run_datatables');

	if( typeof ($.fn.DataTable) === 'undefined'){ return; }
	console.log('init_DataTables');

	var handleDataTableButtons = function() {
		if ($("#datatable-buttons").length) {
			$("#datatable-buttons").DataTable({
				dom: "Blfrtip",
				buttons: [
					{
						extend: "copy",
						className: "btn-sm"
					},
					{
						extend: "csv",
						className: "btn-sm"
					},
					{
						extend: "excel",
						className: "btn-sm"
					},
					
					{
						extend: "print",
						className: "btn-sm"
					},
					],
					responsive: true
			});
		}
	};

	TableManageButtons = function() {
		"use strict";
		return {
			init: function() {
				handleDataTableButtons();
			}
		};
	}();

	$('#datatable').dataTable();

	$('#datatable-keytable').DataTable({
		keys: true
	});
	$('#datatable-responsive tfoot th').each( function () {
		var title = $(this).text();
		$(this).html( '<input type="text" placeholder="'+title+'" />' );
	} );

	//	$('#datatable-responsive').DataTable();
	var file_name = $('#datatable-responsive').closest('.row').find('h2').text();
	function tableblock(call){
		$('#datatable-responsive').DataTable({
			dom: "Bfrtip",
			buttons: [
				{
					extend: 'excelHtml5',
					title: file_name,
					text:'엑셀로 저장'
				},		
				{ extend: 'copy', text: '복사' }
				],
				responsive: true
		},
		call()
		).columns().every( function () {
			var that = this;

			$( 'input', this.footer() ).on( 'keyup change', function () {
				if ( that.search() !== this.value ) {
					that
					.search( this.value )
					.draw();
				}
			} );
		} );	
	}



	tableblock(function(){
		$('#datatable-responsive').closest(".data_table_wrapper").css('display','block')
	})

	function table0block(call){
		$('#Below_7_Request_List').DataTable(
				call()
		)	
	}
	table0block(function(){
		$('#Below_7_Request_List').closest(".data_table_wrapper").css('display','block')
	})
	function table2block(call){
		$('#Below_7_Request_List_By_Employee').DataTable(
				call()
		)	
	}
	table2block(function(){
		$('#Below_7_Request_List_By_Employee').closest(".data_table_wrapper").css('display','block')
	})

	function table3block(call){
		$('#my_CSR_summary').DataTable(
				call()
		)	
	}
	table3block(function(){
		$('#my_CSR_summary').closest(".data_table_wrapper").css('display','block')
	})

	$('#CSR_per_project_table').DataTable({
		pagingType :"simple" 
	});
	$('#CSR_per_person_table').DataTable({
		pagingType :"simple" 
	});

	$('#CSR_per_project_injection_time').DataTable({
		pagingType :"simple" 
	});

	$('#recent_30_project').DataTable({
		pagingType :"simple" ,
		searching: false
	});
	$('#recent_30_CSR').DataTable({
		pagingType :"simple" ,
		searching: false
	});
	$('#quarter_project_table').DataTable({
		pagingType :"simple" ,
		searching: false
	});
	$('#quarter_CSR_table').DataTable({
		pagingType :"simple" ,
		searching: false
	});




	$('#datatable-scroller').DataTable({
		ajax: "js/datatables/json/scroller-demo.json",
		deferRender: true,
		scrollY: 380,
		scrollCollapse: true,
		scroller: true
	});

	$('#datatable-fixed-header').DataTable({
		fixedHeader: true
	});

	var $datatable = $('#datatable-checkbox');

	$datatable.dataTable({
		'order': [[ 1, 'asc' ]],
		'columnDefs': [
			{ orderable: false, targets: [0] }
			]
	});
	$datatable.on('draw.dt', function() {
		$('checkbox input').iCheck({
			checkboxClass: 'icheckbox_flat-green'
		});
	});

	TableManageButtons.init();

};

function init_gauge() {

	if( typeof (Gauge) === 'undefined'){ return; }

	console.log('init_gauge [' + $('.gauge-chart').length + ']');

	console.log('init_gauge');


	var chart_gauge_settings = {
			lines: 12,
			angle: 0,
			lineWidth: 0.4,
			pointer: {
				length: 0.75,
				strokeWidth: 0.042,
				color: '#1D212A'
			},
			limitMax: 'false',
			colorStart: '#009fdc',
			colorStop: '#009fdc',
			strokeColor: '#F0F3F3',
			generateGradient: true
	};


	if ($('#chart_gauge_01').length){ 

		var chart_gauge_01_elem = document.getElementById('chart_gauge_01');
		var chart_gauge_01 = new Gauge(chart_gauge_01_elem).setOptions(chart_gauge_settings);

	}	
	if ($('#gauge-text').length){ 

		var my_achievement  =$('#gauge-text').text();
		chart_gauge_01.maxValue = 100;
		chart_gauge_01.animationSpeed = 32;
		chart_gauge_01.set(my_achievement);
		//chart_gauge_01.setTextField(document.getElementById("gauge-text"));

	}

}   
function change_project_range(date_diff,date_end){

	var chart_plot_02_data = [];

	var dic ={};
	for(var i =0 ; i<$(".project_per_days_day").size();i++){
		dic[$(".project_per_days_day").eq(i).text()] = $(".project_per_days_count").eq(i).text();
	}
	date_end = date_end.add(1).days()
	for (var i = -date_diff; i <= 0; i++) {
		var tmp =date_end.add(-1).days();
		if(getFormatDate(tmp) in dic){
			chart_plot_02_data.push([tmp.getTime(), dic[getFormatDate(tmp)]]);}
		else
			chart_plot_02_data.push([tmp.getTime(),0]);	
	}
	
	var chart_plot_02_settings = {
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			series: {
				lines: {
					show: true,
					fill: true,
					lineWidth: 2,
					steps: false
				},
				points: {
					show: false,
					radius:3,
					symbol: "circle",
					lineWidth: 3.0
				}
			},
			legend: {
				position: "ne",
				margin: [0, -25],
				noColumns: 0,
				labelBoxBorderColor: null,
				labelFormatter: function(label, series) {
					return label + '&nbsp;&nbsp;';
				},
				width: 40,
				height: 1
			},
			colors: ['#1d8de5', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'],
			shadowSize: 0,
			tooltip: true,
			tooltipOpts: {
				content: "%s: %y.0",
				xDateFormat: "%d/%m",
				shifts: {
					x: -30,
					y: -50
				},
				defaultTheme: false
			},
			yaxis: {
				min: 0,
				tick:1,
				tickSize:1
			},
			xaxis: {
				mode: "time",
				minTickSize: [1, "day"],
				timeformat: "%y-%m-%d",
			}
	};	
	if ($("#chart_plot_02").length){
		console.log('Plot2 :'+$("#chart_plot_02").length);

		$.plot( $("#chart_plot_02"), 
				[{ 
					label: "프로젝트 신청 수", 
					data: chart_plot_02_data, 
					lines: { 
						fillColor: "rgba(29,141,229, 0.12)" 
					}, 
					points: { 
						fillColor: "#fff" } 
				}], chart_plot_02_settings);
		$('#chart_plot_02').UseTooltip();

	}
	$('#recent_30_project').DataTable({
		pagingType :"simple" ,
		searching: false
	});
}


function change_csr_range(date_diff,date_end){
	
	var CSR_register_data = [];
	var CSR_register = new Array();
	var dic_csr ={};
	for(var i =0 ; i<$(".csr_per_days_day").size();i++){
		dic_csr[$(".csr_per_days_day").eq(i).text()] = $(".csr_per_days_count").eq(i).text();
	}
date_end = date_end.add(1).days()
	for (var i = -date_diff; i <= 0; i++) {
		var tmp = date_end.add(-1).days();
		if(getFormatDate(tmp) in dic_csr){
			CSR_register_data.push([tmp.getTime(), dic_csr[getFormatDate(tmp)]]);}
		else
			CSR_register_data.push([tmp.getTime(),0]);	
	}
	var chart_plot_02_settings_1 = {
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			series: {
				lines: {
					show: true,
					fill: true,
					lineWidth: 2,
					steps: false
				},
				points: {
					show: false,
					radius: 3,
					symbol: "circle",
					lineWidth: 3.0
				}
			},
			legend: {
				position: "ne",
				margin: [0, -25],
				noColumns: 0,
				labelBoxBorderColor: null,
				labelFormatter: function(label, series) {
					return label + '&nbsp;&nbsp;';
				},
				width: 40,
				height: 1
			},
			colors: ['#1d8de5', '#72c380', '#6f7a8a', '#f7cb38', '#5a8022', '#2c7282'],
			shadowSize: 0,
			tooltip: true,
			tooltipOpts: {
				content: "%s: %y.0",
				xDateFormat: "%d/%m",
				shifts: {
					x: -30,
					y: -50
				},
				defaultTheme: false
			},
			yaxis: {
				min: 0,
				tick:10,
				tickSize:30
			},
			xaxis: {
				mode: "time",
				minTickSize: [1, "day"],
				timeformat: "%y-%m-%d",
		
			}
	};	
	
	if ($("#CSR_per_month").length){
		console.log('Plot2 :'+$("#CSR_per_month").length);

		$.plot( $("#CSR_per_month"), 
				[{ 
					label: "CSR 신청 수", 
					data: CSR_register_data, 
					lines: { 
						fillColor: "rgba(29,141,229, 0.12)" 
					}, 
					points: { 
						fillColor: "#fff" } 
				}], chart_plot_02_settings_1);
		$('#CSR_per_month').UseTooltip();

	}
	$('#recent_30_CSR').DataTable({
		pagingType :"simple" ,
		searching: false
	});
}
function change_quarter_project(label_name,table_id,graph_id,tick_size,date_start,date_diff){
	
	/*분기 별 그래프*/
	var project_per_days_quarter = new Array();
	var dic ={}
	
	for(var i =0 ; i<$("."+table_id+"_day").size();i++){
		dic[$("."+table_id+"_day").eq(i).text()] = $("."+table_id+"_count").eq(i).text();
	}
	
	date_start.add(-1).days()
	for (var i = 0; i <=date_diff; i++) {
		var temp = new Array();
		var day_temp =getFormatDate(date_start.add(1).days())
		if(day_temp in dic){
			temp.push(gd(day_temp.split('-')[0],day_temp.split('-')[1],day_temp.split('-')[2]), dic[day_temp]);
		}
		else
			temp.push(gd(day_temp.split('-')[0],day_temp.split('-')[1],day_temp.split('-')[2]),0);	
		project_per_days_quarter.push(temp);
	}



	var arr_data1 =project_per_days_quarter;
	var chart_plot_01_settings = {
			series: {
				splines: {
					show: true,
					tension: 0.2,
					lineWidth: 1,
					fill: 0.4
				},
				points: {
					radius: 0,
					show: true
				},
				shadowSize: 2
			},
			grid: {
				show: true,
				aboveData: true,
				color: "#3f3f3f",
				labelMargin: 10,
				axisMargin: 0,
				borderWidth: 0,
				borderColor: null,
				minBorderMargin: 5,
				clickable: true,
				hoverable: true,
				autoHighlight: true,
				mouseActiveRadius: 50
			},
			colors: ["rgba(0,159,220,0.7)", "rgba(65,186,231,0.7)"],
			xaxis: {
				tickColor: "rgba(51, 51, 51, 0.06)",
				mode: "time",
				tickSize: [1, "month"],
				//tickLength: 10,
				axisLabel: "Date",
				axisLabelUseCanvas: true,
				axisLabelFontSizePixels: 12,
				axisLabelFontFamily: 'Verdana, Arial',
				axisLabelPadding: 10
			},
			yaxis: {
				min: 0,
				ticks: tick_size,
				tickSize:tick_size,
				tickColor: "rgba(51, 51, 51, 0.06)",
			},
			tooltip: true
	}
	if ($(graph_id).length){
		$.plot( $(graph_id), [{ label:label_name,data:arr_data1}],  chart_plot_01_settings );
		$(graph_id).UseTooltip();
	}
	
	$("#"+table_id).DataTable({
		pagingType :"simple" ,
		searching: false
	});
}
$(document).ready(function() {

	init_gauge();
	init_flot_chart();
	init_sidebar();
	init_wysiwyg();
	init_InputMask();
	init_JQVmap();
	init_cropper();
	init_knob();
	init_TagsInput();
	init_parsley();
	init_daterangepicker();
	init_daterangepicker_right();
	init_daterangepicker_single_call();
	init_daterangepicker_reservation();
	init_SmartWizard();
	init_charts();
	init_skycons();
	init_select2();
	init_validator();
	init_chart_doughnut();
	init_DataTables();
	init_PNotify();
	init_starrr();
	init_compose();
	init_CustomNotification();
	init_autosize();
	init_autocomplete();

});	


