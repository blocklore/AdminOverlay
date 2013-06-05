<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	
	<!-- Styling -->
	<link rel='stylesheet' href="<%= Url.Content("~/css/style.css") %>"/>
	<style>
		html, body {
		    overflow-x: hidden; 
		}
			
		#iframe-wrapper { position:fixed; left:0; width:100%; top:0; height:100%; }
		#iframe { border: none; display: block; width:100%; height:100%; }
		
		#admin-overlay
		{ 
			position: absolute; z-index: 2;
			width: 100%;
			background: #222222 url("<%= Url.Content("~/img/wild_oliva.png") %>") fixed;
		}
		
		#admin-content
		{
			height: 0px; /* initial height */
			border: 0px solid orange;
			border-bottom-width: 5px;
			color: white;
		}
		
		#admin-content.expanded
		{
			transition: all .25s ease;	
		}	
		
		.admin-section *
		{
			padding: .2em .5em;
			font: .9em arial,sans-serif;
		}
		
		.admin-section input[type="text"]
		{
			width: 80%;
			margin-right: 5px;
		}
		
		#admin-tabs
		{ 
			position: absolute;
			display: -webkit-box;
			z-index: 2;
			right: 50px;
			
			font: .9em arial,sans-serif;

			border: 0px solid black;
			border-right-width: 2px;
			border-bottom-width: 2px;
			border-left-width: 2px;
			border-bottom-right-radius: 8px;
			border-bottom-left-radius: 8px;
			padding-left: 5px;
			padding-right: 5px;
			overflow: auto;
			background: black;
		}
		
		#admin-tabs ul
		{
			/* no dots */
			list-style: none;
		}
		
		#admin-tabs ul li
		{
			display: inline;
		}
		
		#admin-tabs ul li span
		{			
			float: left;
			display: block;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
			padding: 5px;
			margin-bottom: 3px;
			text-transform: uppercase;
			color: white;			
			border-style: solid;
			border-color: white;
			border-width: 0px 1px 1px 0px;	
		}
		
		#admin-tabs ul li.selected span 
		{
			background-color: orange;
			border: 0px;	
		}
		
		#admin-tabs label
		{
		    padding: 5px 0px 0px 20px;
		    margin-left: 5px;
		}
		
		.admin-section
		{
			display: none;
			margin: 10px;
		}
		
		.admin-section.displayed
		{
			display: block;
		}
		
		/*
		#admin-settings { height: 200px; }
		#admin-console { height: 180px; }
		#admin-logs { height: 220px; }
		*/
		
	</style>
	
	<style>
	
		/* custom checkbox style! */
		input[type="checkbox"]
		{
		    display:none;
		    height: 10px;
		}
		input[type="checkbox"] + label
		{
			color: white;		
		    display:inline-block;
		    height:19px;
		    vertical-align:bottom;
		    background:url("<%= Url.Content("~/img/DownTriangle.png") %>") left no-repeat;			    
		    cursor:pointer;
		}
		input[type="checkbox"]:checked + label
		{
			background:url("<%= Url.Content("~/img/UpTriangle.png") %>") left no-repeat; 	    
		}
		
	</style>
	
	<!-- Scripting -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<style>
		/* jquery ui styles */
		.ui-button-text-only .ui-button-text
		{
			padding: .2em .5em;
			font-size: .8em;
		}
	</style>	
  	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>	
	<script>
	
		function DisplayTab(adminTab) {
		
			/* remove 'displayed' from any/all sections */
			$('.admin-section').removeClass('displayed');
			
			/* get section id from tab and add 'displayed' class */
			var sectionName = adminTab.data('section-name');
			var section = $('#' + sectionName);
			section.addClass('displayed');
			
			/* set '#admin-content' so it animates and ensure toggle is 'on' */
			$('#admin-content').addClass('expanded').css('height', section.outerHeight(true));
			$('#admin-toggle').prop('checked', true);
			
			/* give the first text input focus */
			section.children('input[type="text"]').focus();
		}
		
		$(document).ready(function () {

			$('#admin-content button').button();
			
			$('.admin-tab').click(function () {
			
				var $input = $(this);
				
				/* remove current selection, mark clicked tab as selected */
				$('.admin-tab').removeClass('selected');
				$input.addClass('selected');
				
				DisplayTab($input);
			});
			
			$('#admin-toggle').click(function () {
			
				var $input = $(this);
				$('#admin-content').toggleClass('expanded');
				
				if ($input.prop('checked'))	{
				
					/* find the current selected tab, show it */
					var selectedAdminTab = $('.admin-tab.selected');
					DisplayTab(selectedAdminTab);
				}
				else
				{
					/* hide everything */
					$('#admin-content').removeClass('expanded').css('height', '0px');
					$('.admin-section').removeClass('displayed');	
					$('iframe').focus();
				}
			});
			
			var availableTags = [
				"ActionScript",
				"AppleScript",
				"Asp",
				"BASIC",
				"C",
				"C++",
				"Clojure",
				"COBOL",
				"ColdFusion",
				"Erlang",
				"Fortran",
				"Groovy",
				"Haskell",
				"Java",
				"JavaScript",
				"Lisp",
				"Perl",
				"PHP",
				"Python",
				"Ruby",
				"Scala",
				"Scheme"
			];
			$('#admin-console input[type="text"]').autocomplete({
			  source: availableTags
			});			
		});
		
	</script>
</head>
<body>
	<!-- Overlay -->
	<div id="admin-overlay">
		<div id="admin-content">
		
			<div id="admin-console" class="admin-section">	
				<label for="admin-search-box"><span>Search:</span></label>		
				<input id="admin-search-box" type="text" />
				<button>Execute</button>
			</div>
			
			<div id="admin-settings" class="admin-section">
				<label for="admin-search-box"><span>Filter:</span></label>		
				<input id="admin-search-box" type="text" />
				
				<div id="settings-nav" >
					<ul>
						<li><a href="#settings-display">Display</a></li>
						<li><a href="#settings-skins">Skins</a></li>
						<li><a href="#settings-repository">Repository</a></li>
					</ul>
				</div>
				<div id="settings-display" class="settings">
					<h1>Display Settings</h1>
					<p>Some display settings go here!</p>
				</div>
				<div id="settings-skins" class="settings">
					<h1>Skin Settings</h1>
					<p>Some skin settings go here!</p>	
				</div>
				<div id="settings-repository" class="settings">
					<h1>Repository Settings</h1>
					<p>Some repository settings go here!</p>				
				</div>
			</div>
			
			<div id="admin-logs" class="admin-section">
				<label for="admin-search-box"><span>Filter:</span></label>		
				<input id="admin-search-box" type="text" />
			</div>
			
		</div>
		<div id="admin-tabs">
			<!-- <span><%= Html.Encode(ViewData["Message"]) %></span>-->
			<ul>
				<li class="admin-tab selected" data-section-name="admin-settings"><span>Settings</span></li>
				<li class="admin-tab" data-section-name="admin-console"><span>Console</span></li>
				<li class="admin-tab" data-section-name="admin-logs"><span>Logging</span></li>
			</ul>
			<input id="admin-toggle" type="checkbox" />
			<label for="admin-toggle" ><span>Admin</span></label>		
		</div>
	</div>
	
	<!-- Content -->
	<div id="iframe-wrapper">
		<iframe id="iframe" src="<%= Url.Content("~/Default.aspx") %>"></iframe>
	</div>
	
</body>

