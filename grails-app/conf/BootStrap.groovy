import com.lucasian.nsjp.app.*
import org.apache.shiro.crypto.hash.Sha256Hash
class BootStrap {

    def init = { servletContext ->
        def ministerioRole = Role.findByName("Ministerio")
        if(!ministerioRole){
            ministerioRole = new Role(name:"Ministerio")
            ministerioRole.addToPermissions("ministerio:*")
            ministerioRole.addToPermissions("home:*")
            ministerioRole.addToPermissions("busqueda:*")
            ministerioRole.addToPermissions("documents:*")
            ministerioRole.save()
        }
        def adminTribunalRole = Role.findByName("Administrador Tribunal")
        if(!adminTribunalRole){
            adminTribunalRole = new Role(name:"Administrador Tribunal")
            adminTribunalRole.addToPermissions("tribAdmin:*")
            adminTribunalRole.addToPermissions("home:*")
            adminTribunalRole.addToPermissions("busqueda:*")
            adminTribunalRole.addToPermissions("repository:*")
            adminTribunalRole.addToPermissions("documents:*")
            adminTribunalRole.save()
        }
        def ministerio1 = User.findByUsername("ministerio1")
        println("usuario encontrado:"+ministerio1)
        if(!ministerio1) {
            ministerio1 = new User(
                username:'ministerio1',
                passwordHash: new Sha256Hash("ministerio1").toHex(),
                nombre: 'Juan Ernesto Perez Robledo',
                institucion: 'PFGJ',
                puesto: 'Ministerio'
            )
            println("guardando usuario"+ministerio1)
            ministerio1.save(failOnError: true)
            ministerioRole.addToUsers(ministerio1)
            ministerioRole.save()
        }
        def adminTrib1 = User.findByUsername('adminTrib1')
        if(!adminTrib1){
            adminTrib1 = new User(
                username:'adminTrib1',
                passwordHash:  new Sha256Hash("adminTrib1").toHex() ,
                nombre: 'Ana Rosa Gomez Mendez',
                institucion: 'TR',
                puesto: 'Tribunal'
            )
            adminTrib1.save(failOnError: true)
            adminTribunalRole.addToUsers(adminTrib1)
            adminTribunalRole.save()
        }
        def cesRole = Role.findByName("CES")
        if(!cesRole){
            cesRole = new Role(name:"CES")
            cesRole.addToPermissions("home:*")
            cesRole.addToPermissions("ministerio:*")
            cesRole.addToPermissions("busqueda:*")
            cesRole.addToPermissions("ces:*")
            cesRole.addToPermissions("documents:*")
            cesRole.save()
        }
        def juezRole = Role.findByName("Juez")
        if(!juezRole){
            juezRole = new Role(name:"Juez")
            juezRole.addToPermissions("home:*")
            juezRole.addToPermissions("busqueda:*")
            juezRole.addToPermissions("documents:*")
            juezRole.save()
        }
        def defensorRole = Role.findByName("Defensor")
        if(!defensorRole){
            defensorRole = new Role(name:"Defensor")
            defensorRole.addToPermissions("home:*")
            defensorRole.addToPermissions("busqueda:*")
            defensorRole.addToPermissions("documents:*")
            defensorRole.save()
        }
        def ces1 = User.findByUsername("ces1")
        println("usuario encontrado:"+ces1)
        if(!ces1) {
            ces1 = new User(
                username:'ces1',
                passwordHash: new Sha256Hash("ces1").toHex(),
                nombre: 'Jose de Jesus Sanchez Flores',
                institucion: 'SSP',
                puesto: 'Procurador'
            )
            println("guardando usuario"+ces1)
            ces1.save(failOnError: true)
            cesRole.addToUsers(ces1)
            cesRole.save()
        }
        def juez1 = User.findByUsername("juez1")
        println("usuario encontrado:"+juez1)
        if(!juez1) {
            juez1 = new User(
                username:'juez1',
                passwordHash: new Sha256Hash("juez1").toHex(),
                nombre: 'Miguel Angel Sanchez Camberos',
                institucion: 'TSJ',
                puesto: 'Juez'
            )
            println("guardando usuario"+juez1)
            juez1.save(failOnError: true)
            juezRole.addToUsers(juez1)
            juezRole.save()
        }
        def juez2 = User.findByUsername("juez2")
        println("usuario encontrado:"+juez2)
        if(!juez2) {
            juez2 = new User(
                username:'juez2',
                passwordHash: new Sha256Hash("juez2").toHex(),
                nombre: 'Victor Manuel Perez Ramos',
                institucion: 'TSJ',
                puesto: 'Juez'
            )
            println("guardando usuario"+juez2)
            juez2.save(failOnError: true)
            juezRole.addToUsers(juez2)
            juezRole.save()
        }
        def defensor1 = User.findByUsername("defensor1")
        println("usuario encontrado:"+defensor1)
        if(!defensor1) {
            defensor1 = new User(
                username:'defensor1',
                passwordHash: new Sha256Hash("defensor1").toHex(),
                nombre: 'William Uriel Rodriguez Muños',
                institucion: 'DP',
                puesto: 'Defensor'
            )
            println("guardando usuario"+defensor1)
            defensor1.save(failOnError: true)
            defensorRole.addToUsers(defensor1)
            defensorRole.save()
        }
        def tiposAudiencias = TipoAudiencia.getAll()
        print(tiposAudiencias)
        if(!tiposAudiencias) {
            def tipo1 = new TipoAudiencia(
                id:294,
                version:0,
                descripcion:'Aprobación de Convenio')
            tipo1.save(failOnError: true)
            def tipo2 = new TipoAudiencia(
                id:1714,
                version:0,
                descripcion:'Control de Detencion')
            tipo2.save(failOnError: true)
            def tipo3 = new TipoAudiencia(
                id:1715,
                version:0,
                descripcion:'Formulación de Imputacion')
            tipo3.save(failOnError: true)
            def tipo4 = new TipoAudiencia(
                id:1716,
                version:0,
                descripcion:'Vinculacion a Proceso')
            tipo4.save(failOnError: true)
            def tipo5 = new TipoAudiencia(
                id:1717,
                version:0,
                descripcion:'Solicitud de Orden de Cateo')
            tipo5.save(failOnError: true)
            def tipo6 = new TipoAudiencia(
                id:1718,
                version:0,
                descripcion:'Solicitud de Orden de Aprehension')
            tipo6.save(failOnError: true)
            def tipo7 = new TipoAudiencia(
                id:2021,
                version:0,
                descripcion:'Audiencia de Debate (Juicio Oral)')
            tipo7.save(failOnError: true)
            def tipo8 = new TipoAudiencia(
                id:2097,
                version:0,
                descripcion:'Audiencia de Ejecución de Sentencia')
            tipo8.save(failOnError: true)
            def tipo9 = new TipoAudiencia(
                id:2774,
                version:0,
                descripcion:'Audiencia Intermedia')
            tipo9.save(failOnError: true)
            def tipo10 = new TipoAudiencia(
                id:2777,
                version:0,
                descripcion:'Individualizacion de sancion')
            tipo10.save(failOnError: true)
            def tipo11 = new TipoAudiencia(
                id:2780,
                version:0,
                descripcion:'Lectura de Resolucion')
            tipo11.save(failOnError: true)
            def tipo12 = new TipoAudiencia(
                id:2783,
                version:0,
                descripcion:'Suspension de Proceso a Prueba')
            tipo12.save(failOnError: true)
            def tipo13 = new TipoAudiencia(
                id:2786,
                version:0,
                descripcion:'Revision de Supension de Proceso a Prueba')
            tipo13.save(failOnError: true)
            def tipo14 = new TipoAudiencia(
                id:2789,
                version:0,
                descripcion:'Conciliacion')
            tipo14.save(failOnError: true)
            def tipo15 = new TipoAudiencia(
                id:2792,
                version:0,
                descripcion:'Revision de Conciliacion')
            tipo15.save(failOnError: true)
            def tipo16 = new TipoAudiencia(
                id:2795,
                version:0,
                descripcion:'Procedimiento Abreviado')
            tipo16.save(failOnError: true)
            def tipo17 = new TipoAudiencia(
                id:6456,
                version:0,
                descripcion:'Ampliacion de Plazo de Cierre de Investigacion')
            tipo17.save(failOnError: true)
            def tipo18 = new TipoAudiencia(
                id:6459,
                version:0,
                descripcion:'Ampliacion de Termino Constitucional')
            tipo18.save(failOnError: true)
            def tipo19 = new TipoAudiencia(
                id:6462,
                version:0,
                descripcion:'Anticipo de Prueba Urgente')
            tipo19.save(failOnError: true)
            def tipo20 = new TipoAudiencia(
                id:6465,
                version:0,
                descripcion:'Autorizacion Judicial para Practica Urgente de Prueba Pericial')
            tipo20.save(failOnError: true)
            def tipo21 = new TipoAudiencia(
                id:6468,
                version:0,
                descripcion:'Comparecencia Espontanea')
            tipo21.save(failOnError: true)
            def tipo22 = new TipoAudiencia(
                id:6477,
                version:0,
                descripcion:'Orden de Comparecencia')
            tipo22.save(failOnError: true)
            def tipo23 = new TipoAudiencia(
                id:6480,
                version:0,
                descripcion:'Solicitud de Extraccion de Muestras Corporales')
            tipo23.save(failOnError: true)
            def tipo24 = new TipoAudiencia(
                id:6501,
                version:0,
                descripcion:'Fallo Deliberatorio')
            tipo24.save(failOnError: true)
            def tipo25 = new TipoAudiencia(
                id:6528,
                version:0,
                descripcion:'Otro Tipo de Audiencia')
            tipo25.save(failOnError: true)
            def tipo26 = new TipoAudiencia(
                id:6779,
                version:0,
                descripcion:'Impugnacion de Determinacion Ministerial')
            tipo26.save(failOnError: true)
        }
    }
    def destroy = {
       
    }
}
