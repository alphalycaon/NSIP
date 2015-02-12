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
            ministerioRole.save()
        }
        def adminTribunalRole = Role.findByName("Administrador Tribunal")
        if(!adminTribunalRole){
            adminTribunalRole = new Role(name:"Administrador Tribunal")
            adminTribunalRole.addToPermissions("tribAdmin:*")
            adminTribunalRole.addToPermissions("home:*")
            adminTribunalRole.addToPermissions("busqueda:*")
            adminTribunalRole.save()
        }
        def ministerio1 = User.findByUsername("ministerio1")
        println("usuario encontrado:"+ministerio1)
        if(!ministerio1) {
            ministerio1 = new User(
                username:'ministerio1',
                passwordHash: new Sha256Hash("ministerio1").toHex()
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
                passwordHash:  new Sha256Hash("adminTrib1").toHex() 
            )
            adminTrib1.save(failOnError: true)
            adminTribunalRole.addToUsers(adminTrib1)
            adminTribunalRole.save()
        }
        def cesRole = Role.findByName("CES")
        if(!cesRole){
            cesRole = new Role(name:"CES")
            cesRole.addToPermissions("home:*")
            cesRole.addToPermissions("busqueda:*")
            cesRole.addToPermissions("ces:*")
            cesRole.save()
        }
        def juezRole = Role.findByName("Juez")
        if(!juezRole){
            juezRole = new Role(name:"Juez")
            cesRole.addToPermissions("home:*")
            cesRole.addToPermissions("busqueda:*")
            juezRole.save()
        }
        def defensorRole = Role.findByName("Defensor")
        if(!defensorRole){
            defensorRole = new Role(name:"Defensor")
            cesRole.addToPermissions("home:*")
            cesRole.addToPermissions("busqueda:*")
            defensorRole.save()
        }
        def ces1 = User.findByUsername("ces1")
        println("usuario encontrado:"+ces1)
        if(!ces1) {
            ces1 = new User(
                username:'ces1',
                passwordHash: new Sha256Hash("ces1").toHex()
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
                passwordHash: new Sha256Hash("juez1").toHex()
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
                passwordHash: new Sha256Hash("juez2").toHex()
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
                passwordHash: new Sha256Hash("defensor1").toHex()
            )
            println("guardando usuario"+defensor1)
            defensor1.save(failOnError: true)
            defensorRole.addToUsers(defensor1)
            defensorRole.save()
        }
    }
    def destroy = {
       
    }
}
