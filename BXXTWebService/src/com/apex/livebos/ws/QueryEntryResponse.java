
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>queryEntryResponse complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
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
     * ��ȡdocumentEntryResult���Ե�ֵ��
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
     * ����documentEntryResult���Ե�ֵ��
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
