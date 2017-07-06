
package com.apex.livebos.ws;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>documentEntryResult complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="documentEntryResult"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://ws.livebos.apex.com/}lbeResult"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="entrys" type="{http://ws.livebos.apex.com/}documentEntry" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "documentEntryResult", propOrder = {
    "entrys"
})
public class DocumentEntryResult
    extends LbeResult
{

    @XmlElement(nillable = true)
    protected List<DocumentEntry> entrys;

    /**
     * Gets the value of the entrys property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the entrys property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getEntrys().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DocumentEntry }
     * 
     * 
     */
    public List<DocumentEntry> getEntrys() {
        if (entrys == null) {
            entrys = new ArrayList<DocumentEntry>();
        }
        return this.entrys;
    }

}
