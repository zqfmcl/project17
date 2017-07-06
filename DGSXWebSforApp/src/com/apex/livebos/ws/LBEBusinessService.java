package com.apex.livebos.ws;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.11
 * 2017-06-01T09:28:21.328+08:00
 * Generated source version: 3.1.11
 * 
 */
@WebService(targetNamespace = "http://ws.livebos.apex.com/", name = "LBEBusinessService")
@XmlSeeAlso({ObjectFactory.class})
public interface LBEBusinessService {

    @WebMethod
    @RequestWrapper(localName = "getNotice", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetNotice")
    @ResponseWrapper(localName = "getNoticeResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetNoticeResponse")
    @WebResult(name = "NoticeResult", targetNamespace = "")
    public com.apex.livebos.ws.NoticeResult getNotice(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "user", targetNamespace = "")
        java.lang.String user,
        @WebParam(name = "type", targetNamespace = "")
        int type
    );

    @WebMethod
    @RequestWrapper(localName = "queryTasks", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryTasks")
    @ResponseWrapper(localName = "queryTasksResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryTasksResponse")
    @WebResult(name = "QueryResult", targetNamespace = "")
    public com.apex.livebos.ws.QueryResult queryTasks(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "caller", targetNamespace = "")
        java.lang.String caller,
        @WebParam(name = "queryOption", targetNamespace = "")
        com.apex.livebos.ws.QueryOption queryOption
    );

    @WebMethod
    @RequestWrapper(localName = "logout", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.Logout")
    @ResponseWrapper(localName = "logoutResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.LogoutResponse")
    @WebResult(name = "LogoutResult", targetNamespace = "")
    public com.apex.livebos.ws.LogoutResult logout(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId
    );

    @WebMethod
    @RequestWrapper(localName = "validateUser", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ValidateUser")
    @ResponseWrapper(localName = "validateUserResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ValidateUserResponse")
    @WebResult(name = "UserInfo", targetNamespace = "")
    public com.apex.livebos.ws.QueryResult validateUser(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "userId", targetNamespace = "")
        java.lang.String userId,
        @WebParam(name = "password", targetNamespace = "")
        java.lang.String password,
        @WebParam(name = "algorithm", targetNamespace = "")
        java.lang.String algorithm,
        @WebParam(name = "securityCode", targetNamespace = "")
        java.lang.String securityCode
    );

    @WebMethod
    @RequestWrapper(localName = "callBizFunction", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.CallBizFunction")
    @ResponseWrapper(localName = "callBizFunctionResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.CallBizFunctionResponse")
    @WebResult(name = "BizFunctionResult", targetNamespace = "")
    public com.apex.livebos.ws.BizFunctionResult callBizFunction(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "bizFunctionName", targetNamespace = "")
        java.lang.String bizFunctionName,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params
    );

    @WebMethod
    @RequestWrapper(localName = "queryTaskListByCondition", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryTaskListByCondition")
    @ResponseWrapper(localName = "queryTaskListByConditionResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryTaskListByConditionResponse")
    @WebResult(name = "QueryResult", targetNamespace = "")
    public com.apex.livebos.ws.QueryResult queryTaskListByCondition(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "caller", targetNamespace = "")
        java.lang.String caller,
        @WebParam(name = "condition", targetNamespace = "")
        com.apex.livebos.ws.WorkCondition condition,
        @WebParam(name = "queryOption", targetNamespace = "")
        com.apex.livebos.ws.QueryOption queryOption
    );

    @WebMethod
    @RequestWrapper(localName = "queryWorkStepDetail", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryWorkStepDetail")
    @ResponseWrapper(localName = "queryWorkStepDetailResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryWorkStepDetailResponse")
    @WebResult(name = "WorkStepDetail", targetNamespace = "")
    public com.apex.livebos.ws.QueryResult queryWorkStepDetail(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "instanceId", targetNamespace = "")
        long instanceId,
        @WebParam(name = "queryOption", targetNamespace = "")
        com.apex.livebos.ws.QueryOption queryOption
    );

    @WebMethod
    @RequestWrapper(localName = "queryWorkflowDescribe", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryWorkflowDescribe")
    @ResponseWrapper(localName = "queryWorkflowDescribeResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryWorkflowDescribeResponse")
    @WebResult(name = "WorkflowDescirbe", targetNamespace = "")
    public com.apex.livebos.ws.WorkflowDescribeResponse queryWorkflowDescribe(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "uid", targetNamespace = "")
        java.lang.String uid,
        @WebParam(name = "startupOnly", targetNamespace = "")
        boolean startupOnly
    );

    @WebMethod
    @RequestWrapper(localName = "doWorkAction", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.DoWorkAction")
    @ResponseWrapper(localName = "doWorkActionResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.DoWorkActionResponse")
    @WebResult(name = "WorkActionResult", targetNamespace = "")
    public com.apex.livebos.ws.WorkActionResult doWorkAction(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "workflowName", targetNamespace = "")
        java.lang.String workflowName,
        @WebParam(name = "instanceId", targetNamespace = "")
        long instanceId,
        @WebParam(name = "actionId", targetNamespace = "")
        int actionId,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params,
        @WebParam(name = "caller", targetNamespace = "")
        java.lang.String caller,
        @WebParam(name = "summary", targetNamespace = "")
        java.lang.String summary
    );

    @WebMethod
    @RequestWrapper(localName = "create", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.Create")
    @ResponseWrapper(localName = "createResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.CreateResponse")
    @WebResult(name = "CreateResult", targetNamespace = "")
    public com.apex.livebos.ws.CreateResult create(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "objectName", targetNamespace = "")
        java.lang.String objectName,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params
    );

    @WebMethod
    @RequestWrapper(localName = "getUserInfo", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetUserInfo")
    @ResponseWrapper(localName = "getUserInfoResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetUserInfoResponse")
    @WebResult(name = "UserInfo", targetNamespace = "")
    public com.apex.livebos.ws.UserInfo getUserInfo(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "loginId", targetNamespace = "")
        java.lang.String loginId
    );

    @WebMethod
    @RequestWrapper(localName = "getWorkOwner", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetWorkOwner")
    @ResponseWrapper(localName = "getWorkOwnerResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetWorkOwnerResponse")
    @WebResult(name = "WorkOwnerResponse", targetNamespace = "")
    public com.apex.livebos.ws.WorkOwnerResponse getWorkOwner(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "instanceId", targetNamespace = "")
        long instanceId,
        @WebParam(name = "stepId", targetNamespace = "")
        int stepId
    );

    @WebMethod
    @RequestWrapper(localName = "doWorkActionByObject", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.DoWorkActionByObject")
    @ResponseWrapper(localName = "doWorkActionByObjectResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.DoWorkActionByObjectResponse")
    @WebResult(name = "WorkActionResult", targetNamespace = "")
    public com.apex.livebos.ws.WorkActionResult doWorkActionByObject(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "objectName", targetNamespace = "")
        java.lang.String objectName,
        @WebParam(name = "id", targetNamespace = "")
        java.lang.String id,
        @WebParam(name = "actionId", targetNamespace = "")
        int actionId,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params,
        @WebParam(name = "caller", targetNamespace = "")
        java.lang.String caller,
        @WebParam(name = "summary", targetNamespace = "")
        java.lang.String summary
    );

    @WebMethod
    @RequestWrapper(localName = "killWorkflow", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.KillWorkflow")
    @ResponseWrapper(localName = "killWorkflowResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.KillWorkflowResponse")
    @WebResult(name = "LBEResult", targetNamespace = "")
    public com.apex.livebos.ws.LbeResult killWorkflow(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "workflowName", targetNamespace = "")
        java.lang.String workflowName,
        @WebParam(name = "caller", targetNamespace = "")
        java.lang.String caller,
        @WebParam(name = "instanceId", targetNamespace = "")
        long instanceId,
        @WebParam(name = "reason", targetNamespace = "")
        java.lang.String reason
    );

    @WebMethod
    @RequestWrapper(localName = "validateSessionId", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ValidateSessionId")
    @ResponseWrapper(localName = "validateSessionIdResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ValidateSessionIdResponse")
    @WebResult(name = "LBEResult", targetNamespace = "")
    public com.apex.livebos.ws.LbeResult validateSessionId(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId
    );

    @WebMethod
    @RequestWrapper(localName = "execBizProcess", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ExecBizProcess")
    @ResponseWrapper(localName = "execBizProcessResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ExecBizProcessResponse")
    @WebResult(name = "BizProcessResult", targetNamespace = "")
    public com.apex.livebos.ws.BizProcessResult execBizProcess(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "bizProcessName", targetNamespace = "")
        java.lang.String bizProcessName,
        @WebParam(name = "id", targetNamespace = "")
        java.lang.String id,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params,
        @WebParam(name = "variables", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> variables
    );

    @WebMethod
    @RequestWrapper(localName = "getWorkAvailableAction", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetWorkAvailableAction")
    @ResponseWrapper(localName = "getWorkAvailableActionResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.GetWorkAvailableActionResponse")
    @WebResult(name = "AvailableWorkActionResponse", targetNamespace = "")
    public com.apex.livebos.ws.AvailableWorkActionResponse getWorkAvailableAction(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "instanceId", targetNamespace = "")
        long instanceId
    );

    @WebMethod
    @RequestWrapper(localName = "query", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.Query")
    @ResponseWrapper(localName = "queryResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.QueryResponse")
    @WebResult(name = "QueryResult", targetNamespace = "")
    public com.apex.livebos.ws.QueryResult query(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "objectName", targetNamespace = "")
        java.lang.String objectName,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params,
        @WebParam(name = "condition", targetNamespace = "")
        java.lang.String condition,
        @WebParam(name = "queryOption", targetNamespace = "")
        com.apex.livebos.ws.QueryOption queryOption
    );

    @WebMethod
    @RequestWrapper(localName = "update", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.Update")
    @ResponseWrapper(localName = "updateResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.UpdateResponse")
    @WebResult(name = "LBEResult", targetNamespace = "")
    public com.apex.livebos.ws.LbeResult update(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "objectName", targetNamespace = "")
        java.lang.String objectName,
        @WebParam(name = "id", targetNamespace = "")
        java.lang.String id,
        @WebParam(name = "params", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> params
    );

    @WebMethod
    @RequestWrapper(localName = "execBizService", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ExecBizService")
    @ResponseWrapper(localName = "execBizServiceResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.ExecBizServiceResponse")
    @WebResult(name = "BizServiceResult", targetNamespace = "")
    public com.apex.livebos.ws.BizProcessResult execBizService(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "bizServiceName", targetNamespace = "")
        java.lang.String bizServiceName,
        @WebParam(name = "variables", targetNamespace = "")
        java.util.List<com.apex.livebos.ws.LbParameter> variables
    );

    @WebMethod
    @RequestWrapper(localName = "login", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.Login")
    @ResponseWrapper(localName = "loginResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.LoginResponse")
    @WebResult(name = "LoginResult", targetNamespace = "")
    public com.apex.livebos.ws.LoginResult login(
        @WebParam(name = "userid", targetNamespace = "")
        java.lang.String userid,
        @WebParam(name = "password", targetNamespace = "")
        java.lang.String password,
        @WebParam(name = "scheme", targetNamespace = "")
        java.lang.String scheme,
        @WebParam(name = "algorithm", targetNamespace = "")
        java.lang.String algorithm,
        @WebParam(name = "securityCode", targetNamespace = "")
        java.lang.String securityCode
    );

    @WebMethod
    @RequestWrapper(localName = "delete", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.Delete")
    @ResponseWrapper(localName = "deleteResponse", targetNamespace = "http://ws.livebos.apex.com/", className = "com.apex.livebos.ws.DeleteResponse")
    @WebResult(name = "LBEResult", targetNamespace = "")
    public com.apex.livebos.ws.LbeResult delete(
        @WebParam(name = "sessionId", targetNamespace = "")
        java.lang.String sessionId,
        @WebParam(name = "objectName", targetNamespace = "")
        java.lang.String objectName,
        @WebParam(name = "id", targetNamespace = "")
        java.lang.String id
    );
}
