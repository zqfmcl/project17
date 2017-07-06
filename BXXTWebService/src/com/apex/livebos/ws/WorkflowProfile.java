
package com.apex.livebos.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>workflowProfile complex type�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * 
 * <pre>
 * &lt;complexType name="workflowProfile"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="attribute" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *         &lt;element name="category" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="describe" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="i18NCategory" type="{http://ws.livebos.apex.com/}i18NString" minOccurs="0"/&gt;
 *         &lt;element name="i18NDescribe" type="{http://ws.livebos.apex.com/}i18NString" minOccurs="0"/&gt;
 *         &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="type" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "workflowProfile", propOrder = {
    "attribute",
    "category",
    "describe",
    "i18NCategory",
    "i18NDescribe",
    "name",
    "type"
})
public class WorkflowProfile {

    protected int attribute;
    protected String category;
    protected String describe;
    protected I18NString i18NCategory;
    protected I18NString i18NDescribe;
    protected String name;
    protected int type;

    /**
     * ��ȡattribute���Ե�ֵ��
     * 
     */
    public int getAttribute() {
        return attribute;
    }

    /**
     * ����attribute���Ե�ֵ��
     * 
     */
    public void setAttribute(int value) {
        this.attribute = value;
    }

    /**
     * ��ȡcategory���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCategory() {
        return category;
    }

    /**
     * ����category���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCategory(String value) {
        this.category = value;
    }

    /**
     * ��ȡdescribe���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescribe() {
        return describe;
    }

    /**
     * ����describe���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescribe(String value) {
        this.describe = value;
    }

    /**
     * ��ȡi18NCategory���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link I18NString }
     *     
     */
    public I18NString getI18NCategory() {
        return i18NCategory;
    }

    /**
     * ����i18NCategory���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link I18NString }
     *     
     */
    public void setI18NCategory(I18NString value) {
        this.i18NCategory = value;
    }

    /**
     * ��ȡi18NDescribe���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link I18NString }
     *     
     */
    public I18NString getI18NDescribe() {
        return i18NDescribe;
    }

    /**
     * ����i18NDescribe���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link I18NString }
     *     
     */
    public void setI18NDescribe(I18NString value) {
        this.i18NDescribe = value;
    }

    /**
     * ��ȡname���Ե�ֵ��
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * ����name���Ե�ֵ��
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * ��ȡtype���Ե�ֵ��
     * 
     */
    public int getType() {
        return type;
    }

    /**
     * ����type���Ե�ֵ��
     * 
     */
    public void setType(int value) {
        this.type = value;
    }

}
