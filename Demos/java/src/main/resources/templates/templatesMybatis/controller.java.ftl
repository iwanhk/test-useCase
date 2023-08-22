package ${package.Controller};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.baomidou.mybatisplus.core.metadata.IPage;
import IdStrPM;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else >
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
import ${package.Service}.${table.serviceName};
import ${cfg.packageurl}.bean.parameterPM.${entity?lower_case}.${entity}Form;
import ${cfg.packageurl}.bean.parameterPM.${entity?lower_case}.${entity}PageForm;
import ${cfg.packageurl}.bean.parameterPM.${entity?lower_case}.${entity}UpdateForm;
import ${cfg.packageurl}.bean.tableVO.${entity}VO;
import ${cfg.packageurl}.bean.ResponseResult;
import java.util.List;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.Valid;
/**
 * <p>
 * ${entity}前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>

@RestController
<#else >
@Controller
</#if>
@Api(tags = "${table.comment}  ${entity}")
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName} <#if superControllerClass>: ${superControllerClass}()</#if>
<#else >
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else >
public class ${table.controllerName} {
</#if>
@Autowired
public ${table.serviceName} ${table.entityPath}Service;

/**
* 保存单条
* @param param 保存参数
* @return 是否添加成功
*/
@ApiOperation(value = "保存", notes = "保存数据到${entity}")
@RequestMapping(value = "/add", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
public ResponseResult add${entity}(@Valid ${entity}Form param) {
        Integer result = ${table.entityPath}Service.save(param);
        return new ResponseResult(result);
        }

/**
* 更新(根据主键id更新)
* @param param 修改参数
* @return 是否更改成功
*/
@ApiOperation(value = "更新数据", notes = "根据主键id更新${entity}数据")
@RequestMapping(value = "/updateById", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
public ResponseResult update${entity}ById(@Valid ${entity}UpdateForm param) {
        Integer result = ${table.entityPath}Service.updateById(param);
        return new ResponseResult(result);
        }

/**
* 删除(根据主键id伪删除)
* @param idPM 主键id
* @return 是否删除成功
*/
@ApiOperation(value = "删除数据", notes = "根据主键id伪删除${entity}数据")
@RequestMapping(value = "/deleteById", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
public ResponseResult delete${entity}ById(@Valid IdStrPM idPM) {
        Integer result = ${table.entityPath}Service.deleteById(idPM.getId());
        return new ResponseResult(result);
        }

/**
* 根据主键id查询单条
* @param idPM 主键id
* @return 查询结果
*/
@ApiOperation(value = "获取单条数据", notes = "根据主键id获取${entity}数据")
@RequestMapping(value = "/getById", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
public ResponseResult get${entity}ById(@Valid IdStrPM idPM) {
    ${entity}VO result = ${table.entityPath}Service.selectById(idPM.getId());
        return new ResponseResult(result);
        }

/**
* 查询全部
* @param param 查询条件
* @return 查询结果
*/
@ApiOperation(value = "全部查询", notes = "查询${entity}全部数据")
@RequestMapping(value = "/queryAll", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
public ResponseResult get${entity}All(@Valid ${entity}Form param) {
        List<${entity}VO> result = ${table.entityPath}Service.selectAll(param);
        return new ResponseResult(result);
        }

/**
* 分页查询
* @param param 查询条件
* @return 查询结果
*/
@ApiOperation(value = "分页查询", notes = "分页查询${entity}全部数据")
@RequestMapping(value = "/queryPage", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
public ResponseResult< IPage<${entity}VO>> get${entity}Page(@Valid ${entity}PageForm param) {
        IPage< ${entity}VO> result = ${table.entityPath}Service.selectPage(param);
        return new ResponseResult(result);
        }
        }

</#if>
