
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>getDocumentResponse complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
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
     * ��ȡdocumentResult���Ե�ֵ��
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
     * ����documentResult���Ե�ֵ��
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
