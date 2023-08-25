package ${cfg.packageurl}.bean.parameterPM.${entity?lower_case};
<#list  table.importPackages as pkg>
    import ${pkg};
</#list>
<#if swagger2>

    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
</#if>
<#if entityLombokModel>
    import lombok.Data;
</#if>
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
/**
* <p>
    * ${entity}Form对象
    * </p>
*
* @author ${author}
* @since ${date}
*/
<#if entityLombokModel>
    @Data
</#if>
@JsonIgnoreProperties(ignoreUnknown = true)
<#if swagger2>
    @ApiModel(value="${entity}对象", description="${table.comment}")
</#if>
public class ${entity}UpdateForm {
<#-- ----------  BEGIN 字段循环遍历  ------------>
<#list  table.fields as field>
    <#if field.keyFlag>
        <#assign keyPropertyName=field.propertyName />
    </#if>
    <#if (logicDeleteFieldName!"")!=field.name&&(field.propertyName!"")!= "createTime"&&(field.propertyName!"")!= "updateTime">
    <#if $!field.comment != "">
        <#if swagger2>
            @ApiModelProperty(value = "${field.comment}")
        <#else >
            /**
            * ${field.comment}
            */
        </#if>
    </#if>
    <#if field.keyFlag>
    <#--主键-->
        <#if field.keyIdentityFlag >
            @TableId(value = "${field.name}", type = IdType.AUTO)
        <#elseif !$null.isNull(idType) && $!idType != "">
            @TableId(value = "${field.name}", type = IdType.${idType})
        <#elseif field.convert >
            @TableId("${field.name}")
        </#if>
    <#--普通字段-->
    <#elseif field.fill?? >
    <#--  存在字段填充设置  -->
        <#if field.convert>
            @TableField(value = "${field.name}", fill = FieldFill.${field.fill})
        <#else >
            @TableField(fill = FieldFill.${field.fill})
        </#if>
    <#elseif field.convert>
        @TableField("${field.name}")
    </#if>
<#-- 乐观锁注解-->
    <#if (versionFieldName!"")==field.name >
        @Version
    </#if>

        <#if field.propertyType="Date">
            @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
            @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
            private Date ${field.propertyName};
        <#else >
            private ${field.propertyType} ${field.propertyName};
        </#if>
    </#if>
</#list>
<#------------  END 字段循环遍历  ------------>
<#if !entityLombokModel>
    <#list  table.fields as field >
        <#if field.propertyType=="boolean">
            <#assign getprefix="is"/>
        <#else >
            <#assign getprefix="get"/>
        </#if>
        public ${field.propertyType} ${getprefix}${field.capitalName}() {
        return ${field.propertyName};
        }
        <#if entityBuilderModel>
            public ${entity} set${field.capitalName}(${field.propertyType} ${field.propertyName}) {
        <#else >
            public void set${field.capitalName}(${field.propertyType} ${field.propertyName}) {
        </#if>
        this.${field.propertyName} = ${field.propertyName};
        <#if entityBuilderModel>
            return this;
        </#if>
        }
    </#list>
</#if>
<#if entityColumnConstant>
    <#list   table.fields as field>
        public static final String ${field.name.toUpperCase()} = "${field.name}";
    </#list>
</#if>
<#if !entityLombokModel>
    @Override
    public String toString() {
    return "${entity}{" +
    <#list  table.fields as field>
        <#if field_index==0>
            "${field.propertyName}=" + ${field.propertyName} +
        <#else >
            ", ${field.propertyName}=" + ${field.propertyName} +
        </#if>
    </#list>
    "}";
    }
</#if>
}