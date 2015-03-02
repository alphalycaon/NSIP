package com.lucasian.nsjp.app

/**
 *
 * @author Angel
 */
interface RepositoryService{
    String storeNode(RepositoryCommand documento)
    List<RepositoryCommand> listItemsInPath(String path)
    List<RepositoryCommand> listFilesInPath(String path)
    Map getVersionContent(String path, String version)
    List<RepositoryCommand> query(String queryText)
}