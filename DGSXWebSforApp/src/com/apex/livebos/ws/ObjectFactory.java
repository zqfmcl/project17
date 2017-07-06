
package com.apex.livebos.ws;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.apex.livebos.ws package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _DeleteDocument_QNAME = new QName("http://ws.livebos.apex.com/", "deleteDocument");
    private final static QName _DeleteDocumentResponse_QNAME = new QName("http://ws.livebos.apex.com/", "deleteDocumentResponse");
    private final static QName _GetDocument_QNAME = new QName("http://ws.livebos.apex.com/", "getDocument");
    private final static QName _GetDocumentResponse_QNAME = new QName("http://ws.livebos.apex.com/", "getDocumentResponse");
    private final static QName _PutDocument_QNAME = new QName("http://ws.livebos.apex.com/", "putDocument");
    private final static QName _PutDocumentResponse_QNAME = new QName("http://ws.livebos.apex.com/", "putDocumentResponse");
    private final static QName _QueryEntry_QNAME = new QName("http://ws.livebos.apex.com/", "queryEntry");
    private final static QName _QueryEntryResponse_QNAME = new QName("http://ws.livebos.apex.com/", "queryEntryResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.apex.livebos.ws
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DeleteDocument }
     * 
     */
    public DeleteDocument createDeleteDocument() {
        return new DeleteDocument();
    }

    /**
     * Create an instance of {@link DeleteDocumentResponse }
     * 
     */
    public DeleteDocumentResponse createDeleteDocumentResponse() {
        return new DeleteDocumentResponse();
    }

    /**
     * Create an instance of {@link GetDocument }
     * 
     */
    public GetDocument createGetDocument() {
        return new GetDocument();
    }

    /**
     * Create an instance of {@link GetDocumentResponse }
     * 
     */
    public GetDocumentResponse createGetDocumentResponse() {
        return new GetDocumentResponse();
    }

    /**
     * Create an instance of {@link PutDocument }
     * 
     */
    public PutDocument createPutDocument() {
        return new PutDocument();
    }

    /**
     * Create an instance of {@link PutDocumentResponse }
     * 
     */
    public PutDocumentResponse createPutDocumentResponse() {
        return new PutDocumentResponse();
    }

    /**
     * Create an instance of {@link QueryEntry }
     * 
     */
    public QueryEntry createQueryEntry() {
        return new QueryEntry();
    }

    /**
     * Create an instance of {@link QueryEntryResponse }
     * 
     */
    public QueryEntryResponse createQueryEntryResponse() {
        return new QueryEntryResponse();
    }

    /**
     * Create an instance of {@link LbeResult }
     * 
     */
    public LbeResult createLbeResult() {
        return new LbeResult();
    }

    /**
     * Create an instance of {@link Document }
     * 
     */
    public Document createDocument() {
        return new Document();
    }

    /**
     * Create an instance of {@link DocumentEntryResult }
     * 
     */
    public DocumentEntryResult createDocumentEntryResult() {
        return new DocumentEntryResult();
    }

    /**
     * Create an instance of {@link DocumentEntry }
     * 
     */
    public DocumentEntry createDocumentEntry() {
        return new DocumentEntry();
    }

    /**
     * Create an instance of {@link DocumentResult }
     * 
     */
    public DocumentResult createDocumentResult() {
        return new DocumentResult();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteDocument }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "deleteDocument")
    public JAXBElement<DeleteDocument> createDeleteDocument(DeleteDocument value) {
        return new JAXBElement<DeleteDocument>(_DeleteDocument_QNAME, DeleteDocument.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteDocumentResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "deleteDocumentResponse")
    public JAXBElement<DeleteDocumentResponse> createDeleteDocumentResponse(DeleteDocumentResponse value) {
        return new JAXBElement<DeleteDocumentResponse>(_DeleteDocumentResponse_QNAME, DeleteDocumentResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetDocument }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "getDocument")
    public JAXBElement<GetDocument> createGetDocument(GetDocument value) {
        return new JAXBElement<GetDocument>(_GetDocument_QNAME, GetDocument.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetDocumentResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "getDocumentResponse")
    public JAXBElement<GetDocumentResponse> createGetDocumentResponse(GetDocumentResponse value) {
        return new JAXBElement<GetDocumentResponse>(_GetDocumentResponse_QNAME, GetDocumentResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PutDocument }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "putDocument")
    public JAXBElement<PutDocument> createPutDocument(PutDocument value) {
        return new JAXBElement<PutDocument>(_PutDocument_QNAME, PutDocument.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PutDocumentResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "putDocumentResponse")
    public JAXBElement<PutDocumentResponse> createPutDocumentResponse(PutDocumentResponse value) {
        return new JAXBElement<PutDocumentResponse>(_PutDocumentResponse_QNAME, PutDocumentResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link QueryEntry }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "queryEntry")
    public JAXBElement<QueryEntry> createQueryEntry(QueryEntry value) {
        return new JAXBElement<QueryEntry>(_QueryEntry_QNAME, QueryEntry.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link QueryEntryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.livebos.apex.com/", name = "queryEntryResponse")
    public JAXBElement<QueryEntryResponse> createQueryEntryResponse(QueryEntryResponse value) {
        return new JAXBElement<QueryEntryResponse>(_QueryEntryResponse_QNAME, QueryEntryResponse.class, null, value);
    }

}
