 package DAL;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import DBContext.CRUD;
import model.ProcessOrderModel;
import model.ProcessStepModel;

public class PROCESSSTEP {

	public	String[] model=new String[4];
	public ProcessStepModel modeldoldur (HttpServletRequest s)
	{
		ProcessStepModel us =new ProcessStepModel();
		us.setProcessDate(s.getParameter(us.GetProcessDate));
		us.setProcessId(Integer.parseInt(s.getParameter(us.GetProcess)!=null?s.getParameter(us.GetProcess):"0"));
		us.setProcessStepId(Integer.parseInt(s.getParameter(us.GetProcessStepId)!=null?s.getParameter(us.GetProcessStepId):"0"));
		us.setUserId(Integer.parseInt(s.getParameter(us.GetUserId)!=null?s.getParameter(us.GetUserId):"0"));
		return us;
	}
	private void model_doldur(ProcessStepModel m){

		model[0]=String.valueOf(m.getProcessStepId());
		model[0]=String.valueOf(m.getUserId());
		model[0]=String.valueOf(m.getProcessId());
		model[0]=String.valueOf(m.getProcessDate());
		
		}
	ProcessStepModel processStep=new ProcessStepModel();
	CRUD cr=new CRUD();

	@SuppressWarnings("static-access")
	public ArrayList<ProcessStepModel> GetProcessOrderList() throws ClassNotFoundException, SQLException
	{
		List<String[]> a= new ArrayList<String[]>();
	    ArrayList<ProcessStepModel> processStepArray =new ArrayList<ProcessStepModel>();
	    a=cr.GetList(processStep.ModelArrayString(),processStep.GetModelName);
		for(String []  lst : a) {
			ProcessStepModel processStep = new ProcessStepModel();
			processStep.setProcessStepId(Integer.parseInt(lst[0].toString()));
			processStep.setUserId(Integer.parseInt(lst[1].toString()));
			processStep.setProcessId(Integer.parseInt(lst[2].toString()));
			processStep.setProcessDate(lst[3].toString());
		
			processStepArray.add(processStep);
	}
		
		return processStepArray;
		}
	public ArrayList<ProcessStepModel> GetProcessOrderList(String WhereItem,String WhereValue) throws ClassNotFoundException, SQLException
	{
		List<String[]> a= new ArrayList<String[]>();
	    ArrayList<ProcessStepModel> processStepArray =new ArrayList<ProcessStepModel>();
	    a=cr.GetListId(processStep.ModelArrayString(),processStep.GetModelName,WhereItem,WhereValue,null);
		for(String []  lst : a) {
			processStep.setProcessStepId(Integer.parseInt(lst[0].toString()));
			processStep.setUserId(Integer.parseInt(lst[1].toString()));
			processStep.setProcessId(Integer.parseInt(lst[2].toString()));
			processStep.setProcessDate(lst[3].toString());
			processStepArray.add(processStep);
	}
		
		return processStepArray;
		}
	public int Create(ProcessStepModel model_) throws ClassNotFoundException, SQLException {
		int a;	model_doldur(model_);
		a=cr.Create(model_.ModelArrayString() ,model, model_.GetModelName);  
		return a;
	}

	public int Edit (ProcessStepModel model_)throws ClassNotFoundException, SQLException {
		model_doldur(model_);
		int a;
		a=cr.Update(model_.ModelArrayString(), model, model_.GetModelName, model_.GetProcessStepId, String.valueOf(model_.getProcessStepId()));
		return a;
	}
	public int Delete (ProcessStepModel model)throws ClassNotFoundException, SQLException {

		int a;
		a=cr.Delete(model.GetModelName,model.GetProcessStepId ,String.valueOf(model.getProcessStepId()));
		return a;
	}

}
