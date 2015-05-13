/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




function loadExplorer(numeroExpediente, path) {
    if (!path) {
        path = "/"
    }
    $('.dz-preview').remove();
    $('#subirArchivo').removeClass('dz-started')
    $.get(contextPath + "/documents/items?numeroExpediente=" + numeroExpediente + "&path=" + path, function (data, status) {
        $("#items").html("");
        $.each(data.items, function (i, item) {
            if (item.mime === "folder") {
                $('<tr>').append(
                        $('<td>').append($('<i>',{class:'fa '+item.icon+' fa-3x'})),
                        $('<td>').append(
                        $('<a>', {
                            text: item.nombre,
                            title: item.nombre,
                            href: '#',
                            click: function () {
                                loadExplorer(numeroExpediente, item.ruta)
                                return false;
                            }
                        })
                        ),                        
                        $('<td>').text('-'),
                        $('<td>').append(
                        getContextMenu()
                        )
                        ).appendTo('#items');
            } else {
                $('<tr>').append(
                        $('<td>').append($('<i>',{class:'fa '+item.icon+' fa-3x'})),
                        $('<td>').append(
                        $('<a>', {
                            text: item.nombre,
                            title: item.nombre,
                            href: contextPath + '/documents/file?numeroExpediente=' + numeroExpediente + '&path=' + item.ruta,
                            target: '_blank'
                        })
                        ),
                        
                        $('<td>').text(item.lastModified),
                        $('<td>').append(
                        getContextMenu()
                        )
                        ).appendTo('#items');
            }
        });
        if (path.length > 1) {
            $('<tr>').append(
                    $('<td>').append(
                    $('<a>', {
                        text: 'Regresar',
                        title: 'Regresar',
                        href: '#',
                        click: function () {
                            loadExplorer(numeroExpediente, data.padre)
                            return false;
                        }
                    })
                    ),
                    $('<td>').text(''),
                    $('<td>').text('')
                    ).appendTo('#items');
        }
        $("#ruta").html(data.path)
    })
}
function getContextMenu() {
    return $('<div>', {class: 'btn-group documentAction'}).append(
            $('<button>', {type: 'button', class: 'btn btn-default', text: 'Action'}),
            $('<button>', {type: 'button', class: 'btn btn-default', 'data-toggle': 'dropdown'}).append(
            $('<span>', {class: 'caret'})
            ),
            $('<ul>', {class: 'dropdown-menu', role: 'menu'}).append(
            $('<li>').append(
            $('<a>', {href: '#', text: 'Compartir'})
            ),
            $('<li>').append(
            $('<a>', {href: '#', text: 'Descargar'})
            ),
            $('<li>').append(
            $('<a>', {href: '#', text: 'Descompartir'})
            )
            )
            )
}
function openUploadModal( ) {
    if (!$("#subirArchivo").hasClass('dropzone')) {
        Dropzone.options.subirArchivo = {
            init: function () {
                this.on("addedfile", function (file) {
                    var tags = prompt("Etiquetas del archivo serparado por comas", "");
                    $("#tags").val(tags);
                });
            }
        };
        $("#subirArchivo").addClass('dropzone').dropzone();
    }
    $("#folder").val($("#ruta").html());
    $('#uploadModal').modal('show');
}
function closeUploadModal(numeroExpediente) {
    $.post(contextPath + "/documents/assign", {expediente: numeroExpediente}, function (result) {
        $('#uploadModal').modal('hide');
        loadExplorer(numeroExpediente, $("#ruta").html());
    });
}
function openCreateFolderModal() {
    $("#createFolderModal").modal('show');
}
function closeCreateFolderModal(numeroExpediente){
    $.post(contextPath + "/documents/createFolder", {expediente: numeroExpediente, path:$("#ruta").html()+"/"+$("#folderName").val()}, function(result){
        $("#folderName").val('');
        $('#createFolderModal').modal('hide');
        $("#folderName").val('');
        loadExplorer(numeroExpediente, $("#ruta").html());
    });
}

function searchType(numeroExpediente, tipo) {
    var url = contextPath + "/documents/search?numeroExpediente=" + numeroExpediente
    console.log(url)
    if (tipo.length > 1) {
        url += "&tipo=" + tipo;
    }
    if ($("#tag").val().length > 1) {
        url += "&tag=" + $("#tag").val();
    }
    $.get(url, function (data, status) {
        $("#items").html("");
        $("#botones").hide();
        $.each(data.items, function (i, item) {
            $('<tr>').append(
                    $('<td>').append($('<i>',{class:'fa '+item.icon+' fa-3x'})),
                    $('<td>').append(
                    $('<a>', {
                        text: item.nombre,
                        title: item.nombre,
                        href: contextPath + '/documents/file?numeroExpediente=' + numeroExpediente + '&path=' + item.ruta,
                        target: '_blank'
                    })
                    ),                    
                    $('<td>').text(item.lastModified),
                    $('<td>').append(
                    getContextMenu()
                    )
                    ).appendTo('#items');
        });
        $('<tr>').append(
                $('<td>').append(
                $('<a>', {
                    text: 'Regresar',
                    title: 'Regresar',
                    href: '#',
                    click: function () {
                        $("#botones").show();
                        loadExplorer(numeroExpediente, "/");
                        return false;
                    }
                })
                ),
                $('<td>').text(''),
                $('<td>').text('')
                ).appendTo('#items');
        $("#ruta").html('Busqueda')
    })
}
