
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>queryTaskListByCondition complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="queryTaskListByCondition"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="sessionId" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="caller" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="condition" type="{http://ws.livebos.apex.com/}workCondition" minOccurs="0"/&gt;
 *         &lt;element name="queryOption" type="{http://ws.livebos.apex.com/}queryOption" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "queryTaskListByCondition", propOrder = {
    "sessionId",
    "caller",
    "condition",
    "queryOption"
})
public class QueryTaskListByCondition {

    protected String sessionId;
    protected String caller;
    protected WorkCondition condition;
    protected QueryOption queryOption;

    /**
     * 获取sessionId属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSessionId() {
        return sessionId;
    }

    /**
     * 设置sessionId属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSessionId(String value) {
        this.sessionId = value;
    }

    /**
     * 获取caller属性的值。
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCaller() {
        return caller;
    }

    /**
     * 设置caller属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCaller(String value) {
        this.caller = value;
    }

    /**
     * 获取condition属性的值。
     * 
     * @return
     *     possible object is
     *     {@link WorkCondition }
     *     
     */
    public WorkCondition getCondition() {
        return condition;
    }

    /**
     * 设置condition属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link WorkCondition }
     *     
     */
    public void setCondition(WorkCondition value) {
        this.condition = value;
    }

    /**
     * 获取queryOption属性的值。
     * 
     * @return
     *     possible object is
     *     {@link QueryOption }
     *     
     */
    public QueryOption getQueryOption() {
        return queryOption;
    }

    /**
     * 设置queryOption属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link QueryOption }
     *     
     */
    public void setQueryOption(QueryOption value) {
        this.queryOption = value;
    }

}
