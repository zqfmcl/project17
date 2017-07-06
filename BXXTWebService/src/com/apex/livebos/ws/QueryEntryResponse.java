
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>queryEntryResponse complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="queryEntryResponse"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="DocumentEntryResult" type="{http://ws.livebos.apex.com/}documentEntryResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "queryEntryResponse", propOrder = {
    "documentEntryResult"
})
public class QueryEntryResponse {

    @XmlElement(name = "DocumentEntryResult")
    protected DocumentEntryResult documentEntryResult;

    /**
     * 获取documentEntryResult属性的值。
     * 
     * @return
     *     possible object is
     *     {@link DocumentEntryResult }
     *     
     */
    public DocumentEntryResult getDocumentEntryResult() {
        return documentEntryResult;
    }

    /**
     * 设置documentEntryResult属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link DocumentEntryResult }
     *     
     */
    public void setDocumentEntryResult(DocumentEntryResult value) {
        this.documentEntryResult = value;
    }

}
