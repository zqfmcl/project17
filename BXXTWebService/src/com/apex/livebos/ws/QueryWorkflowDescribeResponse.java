
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>queryWorkflowDescribeResponse complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="queryWorkflowDescribeResponse"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="WorkflowDescirbe" type="{http://ws.livebos.apex.com/}workflowDescribeResponse" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "queryWorkflowDescribeResponse", propOrder = {
    "workflowDescirbe"
})
public class QueryWorkflowDescribeResponse {

    @XmlElement(name = "WorkflowDescirbe")
    protected WorkflowDescribeResponse workflowDescirbe;

    /**
     * ��ȡworkflowDescirbe���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link WorkflowDescribeResponse }
     *     
     */
    public WorkflowDescribeResponse getWorkflowDescirbe() {
        return workflowDescirbe;
    }

    /**
     * ����workflowDescirbe���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link WorkflowDescribeResponse }
     *     
     */
    public void setWorkflowDescirbe(WorkflowDescribeResponse value) {
        this.workflowDescirbe = value;
    }

}
