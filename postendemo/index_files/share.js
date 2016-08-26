//This script runs right after it is loaded into the page
(function()
{
	var la = // Stores the language specific texts
		{
			'fi':'jaa',
			'da':'Del',
			'sv':'Dela',
			'en':'Share',
			'nb':'Del'
		},
		c = // Stores the settings for each site (it is decided by the .xx ending of the sites domain)
		{
			'.se':
			{
				'facebook':true,
				'twitter':true,
				'mail':true,
				'linkedin':true,
				'c':'#0099bb',
				'exclude':[]
			},
			'.fi':
			{
				'facebook':true,
				'twitter':true,
				'mail':true,
				'linkedin':true,
				'c':'#0099bb',
				'exclude':[]
			},
			'.no':
			{
				'facebook':true,
				'twitter':true,
				'mail':true,
				'linkedin':true,
				'c':'#0099bb',
				'exclude':[]
			},
			'.dk':
			{
				'facebook':true,
				'twitter':true,
				'mail':true,
				'linkedin':true,
				'c':'#CC0000',
				'exclude':[]
			}
		},
		w = window,
		d = document, // quick shortcut to document object
		bm = d.createElement("div"), // creates the main div that we later inject
		e = encodeURIComponent, // shortcut to the function
		l = location // shortcut to the variable
		h = l.href, // shortcut to href
		u = e(h), // readily encoded href string to be used in the links we output
		tNode = d.getElementsByTagName("title")[0],
		t = tNode.innerHTML, // the title of the page to be used in the links we output
		a = //This object contains the social media links and their respective icons. {0} in the links are the url, and {1} is the title
		{
			'facebook':
			{
				'u':'https://www.facebook.com/sharer.php?src=bm&amp;u={0}&t={1}',
				'i':'iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODE2NEMxNjY4OTQ5MTFFNUI2Q0FGQzNGNThEOEI2NTAiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODE2NEMxNjU4OTQ5MTFFNUI2Q0FGQzNGNThEOEI2NTAiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RTg4N0E4MDI4OTQ3MTFFNUE3QTQ4NjJDMDIyM0FERDkiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RTg4N0E4MDM4OTQ3MTFFNUE3QTQ4NjJDMDIyM0FERDkiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4SZodeAAAA0UlEQVR42mL8DwQMqOALA3UAGxTDAQuUZmSgLeAB4s9MDPQBP0AENSxTAuKZQHwXiP8j4d3oClkojCNBID4DpfGBP9TwWTkRFsHAfxYKLTPGIrYHSp/FtO7//8+g1E8mRgcdeNT+o1dqZKBWaiQaMIKCEUjzkqjvPxFqQHHnisSnaTDeo2cwvseWqckBsOTtgsU393D5bDTpj1o2ahl9LOOkVzkMsoyZDhZxIBdXLFD8g0RDXAkVvshFIiO0kcoIFfxDI5+BzP7NQkL9RDEACDAArbjWgp9KCy4AAAAASUVORK5CYII='
			},
			'twitter':
			{
				'u':'https://twitter.com/home?status={0}',
				'i':'iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTk1M0MyMDQ4OTRFMTFFNUJBRTZGQzk2QUI5NzVFNUEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTk1M0MyMDM4OTRFMTFFNUJBRTZGQzk2QUI5NzVFNUEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NUMzOTczNjg4OTQ5MTFFNTlBRUVFQTgxOTJGQURGMDkiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NUMzOTczNjk4OTQ5MTFFNTlBRUVFQTgxOTJGQURGMDkiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7uEbrKAAABL0lEQVR42txWyw2CQBBdiMYYTxuPeqIFWqAFWsASsARsRUuQErAE7EC4eTFxnY2D2RBmFiJsoi95WSOObx9v9uMpgHAEH8c10JuAK+Oz8NCZN7GpJfDuSkxD+cIhfk4s/FYsAEpLbQqsgIXOA5hhXUZOQL0hWkyBBVB2PNOMFY0MGHbUkA0icXYlMOp4nhB1NTDGsbezpDXbM37XOK0YZyHxNhQlFqAABU5MUGI+E37ANIccs/VPFjHB1A0Wy4E7MmgaOb9h0e+5yY3Lx0TJ5MVmpnFF9s1nb9+K+Q5qlsHR4iqz/IfVmdl1EfObQy9XlkVdWNzoPKMejj7OuMNT4tYTGsugxhx1i1+GHp5/eVIvXJ7UT1NsO/Ft4GGK3fC6tcFxLMzR1cy8NzrBS4ABAO4HZVi16+4EAAAAAElFTkSuQmCC'
			},
			'mail':
			{
				'u':'mailto:?Subject={1}-{0}',
				'i':'iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzJBMTA3MDc4OTRFMTFFNTg4RTJCMDk1MzVCMTUxNUIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzJBMTA3MDY4OTRFMTFFNTg4RTJCMDk1MzVCMTUxNUIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6M0ZCMzQzNDI4OTQ5MTFFNThGQzRDN0JEMTM1NjYyMUYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6M0ZCMzQzNDM4OTQ5MTFFNThGQzRDN0JEMTM1NjYyMUYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4h1lNCAAABEElEQVR42mL8DwQMdAIsUJqRhnZwAPEPIP7PhCRAKwCySALEYEISoDlghMYZIx3sggcjXRMINmAMxIJkmHkPirH4DQIYkLAgEJ/5TxmYiWYm2B5sceYCxLupkR6IibM9OIOBeNBJbDCCsDEFQbkKGhUYwYjNMhcg7oCyO0iw5B0Qh0ItWoXNMlxJvxyIz0CD1ASIzxIIttVArAxl3wXiUGKD0QXNxR1Q15ZDXY8M7kLVK0F9gwyIDsb/eAydCY1PfI6gyDLkyDeGqgslkIgGXz6jGcBm2XsqmPue2IIYlMzDgDiNAos6R1Z9NiCWcdDYnkBkyyRoaJEaEJ9HtuwB1HfUthRk3iP0pE+XVjFAgAEAHNV1UcWK0rkAAAAASUVORK5CYII='
			},
			'linkedin':
			{
				'u':'http://www.linkedin.com/shareArticle?mini=true&url={0}&title={1}',
				'i':'iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OEFDQUMzNjc4OTRDMTFFNThCNDVCQzU3NEQxQUVGOTIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OEFDQUMzNjY4OTRDMTFFNThCNDVCQzU3NEQxQUVGOTIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTc2RTU1OTY4OTQ4MTFFNTkyNjQ4NjFEMERGRTVFRkQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTc2RTU1OTc4OTQ4MTFFNTkyNjQ4NjFEMERGRTVFRkQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4xGV9uAAABJElEQVR42mL8DwQMqOAXA3UACxAzoQuAACMQswLxbwbqApCZXFD2B5jNIjSwiAFq5keYhTDL3jDQATDhiCMlIHYBYkEq2fMcTALTx09QGkHCoUD87j8EgGglNHly8X8mLK5IQ/KRIJRPtWBEB/cI8CnKC+igAinezgLxLGpZxgiKMyDNTofEiDPOdiNhYzziILG7IIOA+B0Qr4KGCA7rMFNjx39U4IJDHJ3/HykFGxObGokF5TjEQSm4g9jUSCx4D8RhQCwExJ1oclgLBEosA6Xa1VBLK6A0MjCmpmXo+e8sOZmapgXxqGWjluEtiP8CaWZ6FcRMSC0gWgFn5GD8TUOLzIB4LywYQdUDGxBLAPEnaNOLWkAWiB/DgpGFyq1gvAAgwADa2PAOgXhyxgAAAABJRU5ErkJggg=='
			}
		},
		cl = function() //sets the current language of the page. Some sites vary between the 'xml:lang="xx"' and 'lang="xx"' attribute
		{
			var h = d.getElementsByTagName("html")[0], //get the html tag
				l = h.getAttribute("xml:lang");		// first get xml:lang attribute
			l = (l === null) ? h.getAttribute("lang") : l; // if it was empty get the lang attribute
			return l.substring(0,2); //return the first 2 chars
		}(),
		cs = function() //sets he current site depending on the site's domain. Might need to be rewritten to catch more of the url
		{
			var h = l.host, // get the current hostname
				d = h.substring(h.lastIndexOf('.')); //get the key that we use to resolve which site we are on
			//d = ".se"; // DEBUG: hardcoded for when working against localhost
			return c[d];
			
		}(),
		ml = function(k) // makes the links we inject into the site
		{
			return '<a href="'+ a[k].u.replace("{0}",u).replace("{1}",t) +'" target="_blank" style="display:inline-block;width:27px;height:27px;margin-left:13px;">'+
						'<img alt="" style="border:0;background:'+ cs.c +'" src="data:image/png;base64,'+ a[k].i +'"/></a>';
		},
		cm = function() //creates the markup that we inject
		{
			var result = ""; // get the translated text for "Share"
			if(cs) // Check that we actually found a site
			{
				// result = '<span style="font-family:StagSansWeb Book;display: inline-block;vertical-align: super;"><b>'+ la[cl] + '</b></span>';
				for(k in a) //Loop each social media link
				{
					result += ((cs[k]) ? ml(k) : ''); // Check the site's setting to see if the iterated social media type is enabled in the site setting. If so we create the link and add to the result
				}
			}
			return result;
		}(),
		ie = function() // checks if the page we are on is not excluded in any sort of way
		{
			var e = cs.exclude, // reassign the exclude variable
				r = true; // the result variable
			for(k in e) // loop through the excluded array
			{
				r = (h.indexOf(e[k]) !== -1) ? false : r; // Check that the current href does not contain anything found in the exclution array.
			}
			return r;
		};
		
	function onload () //Runt after the page is fully loaded
	{
		if(cs && la[cl] && ie())  // check that we found the site, and the translated text, and that the page is not excluded
		{
			var markup = (cm.length !== 0) ? cm : "";
			if(markup.length !== 0)
			{
				bm.setAttribute('style',"padding:12px 0px;height:27px;line-height:27px;vertical-align:top;text-align:right;"); // Set the style of the main markup element
				bm.innerHTML =	markup; // Add the generated content
			}
		}

		var b = d.getElementById("Body");
		if(b) {
			var divs=b.querySelectorAll('.colspan-3');
			if(divs.length>0 && bm.innerHTML.length !== 0) {
				divs[0].appendChild(bm); //Append the generated content to the body div
			}
		}

	}
	//#region onload
	if (w.addEventListener)
	{
		w.addEventListener("load", onload, false);
	}
	else if (w.attachEvent)
	{
		w.attachEvent("onload", onload);
	}
	else
	{
		w.onload = onload;
	}
	//#endregion
})();
