<%@ Page Language="C#" Inherits="OverlayPrototype.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head runat="server">
	<title>Default</title>
	<link rel='stylesheet' href='css/style.css'/>	
	<style>
		html, body {
		    overflow-x: hidden;
		}
			
		article { margin-left: 50px; }
		
		section {
		   width: 80%;
		   margin: 0 auto;
		}
		h2, h3 {
		   position: relative;
		   background: black;
		   color: white;
		   padding: 15px 0; 
		}
		h2:before, h2:after, h3:before, h3:after {
		   content: ""; /* creates physical element to work with (no longer pseudo!) */
		   position: absolute;
		   background: black;  /* Match the background */
		   top: 0;
		   bottom: 0;
		   width: 9999px;   /* some huge width */
		} 
		h2:before, h3:before {
		   right: 100%; 
		}
		h2:after, h3:after {
		   left: 100%;
		}		
		
		h2:nth-of-type(1), h2:nth-of-type(1):before, h2:nth-of-type(1):after { background: red; }
		
		section:nth-of-type(1) h3, section:nth-of-type(1) h3:before, section:nth-of-type(1) h3:after { background: #dc4916; }
		section:nth-of-type(2) h3, section:nth-of-type(2) h3:before, section:nth-of-type(2) h3:after { background: #6871b1; }
		section:nth-of-type(3) h3, section:nth-of-type(3) h3:before, section:nth-of-type(3) h3:after { background: #d1b935; }
    		
   	    /* odd heading have nothing to the left */
		section:nth-of-type(odd) h3:before { 	    
			width: 20px;
	    }
	     		
    	/* even headings have nothing to the right */
	    section:nth-of-type(even) h3:after { 
			display: none;
	    }
     		
	</style>
</head>
<body>
	<article>
		<h1>Amazing content!</h1>
		<h2>How to use the section tag</h2>
		<section id="disclaimer">
			<h3>Disclaimer</h3>
			<p>Don't take my word for it...</p>
		</section>
		<section id="examples">
			<h3>Examples</h3>
			<p>But here's how I would do it...</p>
		</section>
		<section id="closing_notes">
			<h3>Closing Notes</h3>
			<p>Well that was fun. I wonder if the spec will change next week?</p>
		</section>
  	</article>	
	<form id="form1" runat="server">	
		<asp:Button id="button1" runat="server" Text="Click me!" OnClick="button1Clicked" />
	</form>
</body>
</html>
