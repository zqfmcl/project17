(function(d, a, b, c) {
	function e(f) {
		return a.getElementById(f)
	}
	b.runtimes.Html4 = b.addRuntime("html4", {
		getFeatures : function() {
			return {
				multipart : true,
				triggerDialog : (b.ua.gecko && d.FormData || b.ua.webkit)
			}
		},
		init : function(f, g) {
			f.bind("Init", function(p) {
				var j = a.body,
					n,
					h = "javascript",
					k,
					x,
					q,
					z = [],
					r = /MSIE/.test(navigator.userAgent),
					t = [],
					m = p.settings.filters,
					o,
					l,
					s,
					w;
				no_type_restriction:
				for (o = 0; o < m.length; o++) {
					l = m[o].extensions.split(/,/);
					for (w = 0; w < l.length; w++) {
						if (l[w] === "*") {
							t = [];break no_type_restriction
						}
						s = b.mimeTypes[l[w]];
						if (s && b.inArray(s, t) === -1) {
							t.push(s)
						}
					}
				}
				t = t.join(",");
				function v() {
					var B,
						y,
						i,
						A;
					q = b.guid();z.push(q);
					B = a.createElement("form");B.setAttribute("id", "form_" + q);B.setAttribute("method", "post");B.setAttribute("enctype", "multipart/form-data");B.setAttribute("encoding", "multipart/form-data");B.setAttribute("target", p.id + "_iframe");
					B.style.position = "absolute";
					y = a.createElement("input");y.setAttribute("id", "input_" + q);y.setAttribute("type", "file");y.setAttribute("accept", t);y.setAttribute("size", 1);
					A = e(p.settings.browse_button);
					if (p.features.triggerDialog && A) {
						b.addEvent(e(p.settings.browse_button), "click", function(C) {
							if (!y.disabled) {
								y.click()
							}
							C.preventDefault()
						}, p.id)
					}
					b.extend(y.style, {
						width : "100%",
						height : "100%",
						opacity : 0,
						fontSize : "99px",
						cursor : "pointer"
					});b.extend(B.style, {
						overflow : "hidden"
					});
					i = p.settings.shim_bgcolor;
					if (i) {
						B.style.background = i
					}
					if (r) {
						b.extend(y.style, {
							filter : "alpha(opacity=0)"
						})
					}
					b.addEvent(y, "change", function(F) {
						var D = F.target,
							C,
							E = [],
							G;
						if (D.value) {
							e("form_" + q).style.top = -1048575 + "px";
							C = D.value.replace(/\\/g, "/");
							C = C.substring(C.length, C.lastIndexOf("/") + 1);E.push(new b.File(q, C));
							if (!p.features.triggerDialog) {
								b.removeAllEvents(B, p.id)
							} else {
								b.removeEvent(A, "click", p.id)
							}
							b.removeEvent(y, "change", p.id);v();
							if (E.length) {
								f.trigger("FilesAdded", E)
							}
						}
					}, p.id);B.appendChild(y);j.appendChild(B);p.refresh()
				}
				function u() {
					var i = a.createElement("div");
					i.innerHTML = '<iframe id="' + p.id + '_iframe" name="' + p.id + '_iframe" src="' + h + ':&quot;&quot;" style="display:none"></iframe>';
					n = i.firstChild;j.appendChild(n);b.addEvent(n, "load", function(C) {
						var D = C.target,
							B,
							y;
						if (!k) {
							return
						}
						try {
							B = D.contentWindow.document || D.contentDocument || d.frames[D.id].document
						} catch (A) {
							p.trigger("Error", {
								code : b.SECURITY_ERROR,
								message : b.translate("Security error."),
								file : k
							});return
						}
						y = B.body.innerHTML;
						if (y) {
							k.status = b.DONE;
							k.loaded = 1025;
							k.percent = 100;p.trigger("UploadProgress", k);p.trigger("FileUploaded", k, {
								response : y
							})
						}
					}, p.id)
				}
				if (p.settings.container) {
					j = e(p.settings.container);
					if (b.getStyle(j, "position") === "static") {
						j.style.position = "relative"
					}
				}
				p.bind("UploadFile", function(i, A) {
					var B,
						y;
					if (A.status == b.DONE || A.status == b.FAILED || i.state == b.STOPPED) {
						return
					}
					B = e("form_" + A.id);
					y = e("input_" + A.id);y.setAttribute("name", i.settings.file_data_name);B.setAttribute("action", i.settings.url);b.each(b.extend({
						name : A.target_name || A.name
					}, i.settings.multipart_params), function(E, C) {
						var D = a.createElement("input");
						b.extend(D, {
							type : "hidden",
							name : C,
							value : E
						});B.insertBefore(D, B.firstChild)
					});
					k = A;
					e("form_" + q).style.top = -1048575 + "px";B.submit()
				});p.bind("FileUploaded", function(i) {
					i.refresh()
				});p.bind("StateChanged", function(i) {
					if (i.state == b.STARTED) {
						u()
					} else {
						if (i.state == b.STOPPED) {
							d.setTimeout(function() {
								b.removeEvent(n, "load", i.id);
								if (n.parentNode) {
									n.parentNode.removeChild(n)
								}
							}, 0)
						}
					}
					b.each(i.files, function(A, y) {
						if (A.status === b.DONE || A.status === b.FAILED) {
							var B = e("form_" + A.id);
							if (B) {
								B.parentNode.removeChild(B)
							}
						}
					})
				});p.bind("Refresh", function(y) {
					var F,
						A,
						B,
						C,
						i,
						G,
						H,
						E,
						D;
					F = e(y.settings.browse_button);
					if (F) {
						i = b.getPos(F, e(y.settings.container));
						G = b.getSize(F);
						H = e("form_" + q);
						E = e("input_" + q);b.extend(H.style, {
							top : i.y + "px",
							left : i.x + "px",
							width : G.w + "px",
							height : G.h + "px"
						});
						if (y.features.triggerDialog) {
							if (b.getStyle(F, "position") === "static") {
								b.extend(F.style, {
									position : "relative"
								})
							}
							D = parseInt(F.style.zIndex, 10);
							if (isNaN(D)) {
								D = 0
							}
							b.extend(F.style, {
								zIndex : D
							});b.extend(H.style, {
								zIndex : D - 1
							})
						}
						B = y.settings.browse_button_hover;
						C = y.settings.browse_button_active;
						A = y.features.triggerDialog ? F : H;
						if (B) {
							b.addEvent(A, "mouseover", function() {
								b.addClass(F, B)
							}, y.id);b.addEvent(A, "mouseout", function() {
								b.removeClass(F, B)
							}, y.id)
						}
						if (C) {
							b.addEvent(A, "mousedown", function() {
								b.addClass(F, C)
							}, y.id);b.addEvent(a.body, "mouseup", function() {
								b.removeClass(F, C)
							}, y.id)
						}
					}
				});f.bind("FilesRemoved", function(y, B) {
					var A,
						C;
					for (A = 0; A < B.length; A++) {
						C = e("form_" + B[A].id);
						if (C) {
							C.parentNode.removeChild(C)
						}
					}
				});f.bind("DisableBrowse", function(i, A) {
					var y = a.getElementById("input_" + q);
					if (y) {
						y.disabled = A
					}
				});f.bind("Destroy", function(i) {
					var y,
						A,
						B,
						C = {
							inputContainer : "form_" + q,
							inputFile : "input_" + q,
							browseButton : i.settings.browse_button
						};
					for (y in C) {
						A = e(C[y]);
						if (A) {
							b.removeAllEvents(A, i.id)
						}
					}
					b.removeAllEvents(a.body, i.id);b.each(z, function(E, D) {
						B = e("form_" + E);
						if (B) {
							j.removeChild(B)
						}
					})
				});v()
			});g({
				success : true
			})
		}
	})
})(window, document, plupload);