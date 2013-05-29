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
			height: 30px; /* initial height */
			margin-top: -50px; /* initially hidden above screen */
			padding: 10px;
			border: 0px solid black;
			border-bottom-width: 5px;
			color: white;
		}
		
		#admin-content.expanded
		{
			margin-top: 0px; /* show the hidden content */
			transition: all .25s ease;	
		}	
		
		#admin-search *
		{
			padding: .2em .5em;
			font: .9em arial,sans-serif;
		}
		
		#admin-search input[type="text"]
		{
			width: 80%;
			margin-right: 5px;
		}
		
		#admin-tab
		{ 
			position: absolute;
			z-index: 2;
			right: 50px;

			border: 0px solid black;
			border-right-width: 2px;
			border-bottom-width: 2px;
			border-left-width: 2px;
			border-bottom-right-radius: 8px;
			border-bottom-left-radius: 8px;
			padding: 5px;
			overflow: auto;
			/* background: #222222 url("<%= Url.Content("~/img/wild_oliva.png") %>") fixed;	*/
			background: black;
		}
		
		#admin-tab ul, #admin-tab il, #admin-tab span, #admin-tab input { float: left; }
		#admin-tab span { padding-top: 3px; }
		#admin-tab > span { color: grey; }	
		#admin-tab span:first-child { margin-right: 8px; }
		
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
		    padding-left: 20px;
		    vertical-align:middle;
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
		
		$(document).ready(function () {

			$('#admin-content button').button();
			$('#admin-toggle').click(function () {
				var $input = $(this);
				$('#admin-content').toggleClass('expanded');
				if ($input.prop('checked'))	
					$('#admin-search input[type="text"]').focus();
				else
					$('iframe').focus();
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
			$('#admin-search input[type="text"]').autocomplete({
			  source: availableTags
			});			
		});
		
	</script>
</head>
<body>
	<!-- Overlay -->
	<div id="admin-overlay">
		<div id="admin-content">
			<div id="admin-search">	
				<label for="admin-search-box"><span>Search:</span></label>		
				<input id="admin-search-box" type="text" />
				<button>Execute</button>
			</div>
		</div>
		<div id="admin-tab">
			<span><%= Html.Encode(ViewData["Message"]) %></span>
			<input id="admin-toggle" type="checkbox" />
			<label for="admin-toggle" ><span>Admin</span></label>		
		</div>
	</div>
	
	<!-- Content -->
	<div id="iframe-wrapper">
		<iframe id="iframe" src="<%= Url.Content("~/Default.aspx") %>"></iframe>
	</div>
	
</body>

