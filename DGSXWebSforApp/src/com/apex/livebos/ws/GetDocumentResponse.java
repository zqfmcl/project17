
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>getDocumentResponse complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="getDocumentResponse"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="DocumentResult" type="{http://ws.livebos.apex.com/}documentResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getDocumentResponse", propOrder = {
    "documentResult"
})
public class GetDocumentResponse {

    @XmlElement(name = "DocumentResult")
    protected DocumentResult documentResult;

    /**
     * 获取documentResult属性的值。
     * 
     * @return
     *     possible object is
     *     {@link DocumentResult }
     *     
     */
    public DocumentResult getDocumentResult() {
        return documentResult;
    }

    /**
     * 设置documentResult属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link DocumentResult }
     *     
     */
    public void setDocumentResult(DocumentResult value) {
        this.documentResult = value;
    }

}
