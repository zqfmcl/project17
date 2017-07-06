
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>queryWorkStepDetailResponse complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="queryWorkStepDetailResponse"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="WorkStepDetail" type="{http://ws.livebos.apex.com/}queryResult" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "queryWorkStepDetailResponse", propOrder = {
    "workStepDetail"
})
public class QueryWorkStepDetailResponse {

    @XmlElement(name = "WorkStepDetail")
    protected QueryResult workStepDetail;

    /**
     * ��ȡworkStepDetail���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link QueryResult }
     *     
     */
    public QueryResult getWorkStepDetail() {
        return workStepDetail;
    }

    /**
     * ����workStepDetail���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link QueryResult }
     *     
     */
    public void setWorkStepDetail(QueryResult value) {
        this.workStepDetail = value;
    }

}
