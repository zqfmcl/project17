
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>noticeResult complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="noticeResult"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://ws.livebos.apex.com/}lbeResult"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="workflowCount" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "noticeResult", propOrder = {
    "workflowCount"
})
public class NoticeResult
    extends LbeResult
{

    protected int workflowCount;

    /**
     * ��ȡworkflowCount���Ե�ֵ��
     * 
     */
    public int getWorkflowCount() {
        return workflowCount;
    }

    /**
     * ����workflowCount���Ե�ֵ��
     * 
     */
    public void setWorkflowCount(int value) {
        this.workflowCount = value;
    }

}
