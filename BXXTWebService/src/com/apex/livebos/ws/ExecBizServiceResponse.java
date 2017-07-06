
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>execBizServiceResponse complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="execBizServiceResponse"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="BizServiceResult" type="{http://ws.livebos.apex.com/}bizProcessResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "execBizServiceResponse", propOrder = {
    "bizServiceResult"
})
public class ExecBizServiceResponse {

    @XmlElement(name = "BizServiceResult")
    protected BizProcessResult bizServiceResult;

    /**
     * ��ȡbizServiceResult���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link BizProcessResult }
     *     
     */
    public BizProcessResult getBizServiceResult() {
        return bizServiceResult;
    }

    /**
     * ����bizServiceResult���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link BizProcessResult }
     *     
     */
    public void setBizServiceResult(BizProcessResult value) {
        this.bizServiceResult = value;
    }

}
