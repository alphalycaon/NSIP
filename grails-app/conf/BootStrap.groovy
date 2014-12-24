import com.lucasian.nsjp.app.*
import org.apache.shiro.crypto.hash.Sha256Hash
class BootStrap {

    def init = { servletContext ->
        def ministerioRole = Role.findByName("Ministerio")
        if(!ministerioRole){
            ministerioRole = new Role(name:"Ministerio")
            ministerioRole.addToPermissions("ministerio:*")
            ministerioRole.addToPermissions("home:*")
            ministerioRole.save()
        }
        def adminTribunalRole = Role.findByName("Administrador Tribunal")
        if(!adminTribunalRole){
            adminTribunalRole = new Role(name:"Administrador Tribunal")
            adminTribunalRole.addToPermissions("tribAdmin:*")
            adminTribunalRole.addToPermissions("home:*")
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
    }
    def destroy = {
       
    }
}
