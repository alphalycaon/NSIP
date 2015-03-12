import groovy.xml.StreamingMarkupBuilder


eventWebXmlEnd = {String tmpfile ->
	
    def root = new XmlSlurper().parse(webXmlFile)
    root.appendNode {
       'listener' {
		   'listener-class' (
			   'com.lucasian.nsjp.notificacion.ServletNoticacion'
		   )
        }
    }
    webXmlFile.text = new StreamingMarkupBuilder().bind {
        mkp.declareNamespace(
                "": "http://java.sun.com/xml/ns/javaee")
        mkp.yield(root)
    }
}
 No newline at end of file