<!--- Place HTML here that should be used as the default layout of your application --->
		<cfoutput>

		<html>
				<head>
					#stylesheetlinktag("base,jquery-ui-1.8.13.custom")#
					#javaScriptIncludeTag("jquery-1.6.4.min, jquery-ui-1.8.13.custom.min,global")#
				
				</head>
			<body>
				<div id="wrapper"> 
					<div id="header">
						REVOLUTION WINES
					</div>
					<div id="content">
					#includeContent()#
					</div>
				</div>
					
			</body>
		</html>
		
		</cfoutput>