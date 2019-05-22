package controller;

import dao.LoginCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.*;
import service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@Component
public class UserController {

    @Autowired
    private UserService userService = null;
    @Autowired
    private LoginCheck loginCheck = null;
    private StaffWork staffWork ;
    private StaffWork admin ;
    private List<DeskChange> deskChange;
    private List<DeskChange> deskChange2;
    private List<Resign> resigns;
    private List<Resign> resigns2;
    private List<Appeal> appeals;
    private List<Appeal> appeals2;
    private List<Notice> notice;
    private List<StaffPersonal> personals;
    private String flag = "showtitle";
    private StaffPersonal staffPersonal = new StaffPersonal();

    private ModelAndView modelAndView;
    private ModelAndView adminView;
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password){
        modelAndView = new ModelAndView();

        if(email.equals("admin")&&password.equals("admin")){
            adminView = new ModelAndView();
            admin = new StaffWork();
            admin.setName("管理员");
            admin.setWorkId("0001");
            admin.setJob("系统管理员");
            admin.setDepartment("运营部");
            flag = "powermanage";
            adminView.addObject("flag",flag);
            adminView.addObject("admin",admin);
            adminView.setViewName("admin");
            return adminView;
        }

        if(loginCheck.loginForRegist(email,password)){
            staffPersonal.setIdcardNum(email);
            modelAndView.setViewName("register");
        }else if(loginCheck.loginForMain(email,password)){
            flag = "showtitle";
            modelAndView.setViewName("main");
            staffWork = userService.getUser(email);
            deskChange = userService.getDeskChangeList(staffWork.getWorkId());
            deskChange2 = userService.getDeskChangeList2(staffWork.getWorkId());
            resigns = userService.getResignList(staffWork.getWorkId());
            resigns2 = userService.getResignList2(staffWork.getWorkId());
            appeals2 = userService.getAppealList2(staffWork.getWorkId());
            appeals = userService.getAppealList(staffWork.getWorkId());
            notice = userService.getNoticeList();
            personals = userService.getNewWorkers();
            modelAndView.addObject("flag",flag);
            modelAndView.addObject("noticelist",notice);
            modelAndView.addObject("appealList",appeals);
            modelAndView.addObject("appealList2",appeals2);
            modelAndView.addObject("resignlist",resigns);
            modelAndView.addObject("resignlist2",resigns2);
            modelAndView.addObject("deskChangelist2",deskChange2);
            modelAndView.addObject("deskChangelist",deskChange);
            modelAndView.addObject("staffwork",staffWork);
            if(personals.size()!=0){
                modelAndView.addObject("staffpersonal",personals.get(0));
            }
        }
        return modelAndView;
    }
    @RequestMapping("/regist")
    public ModelAndView regist(@Valid StaffPersonal staffPersonal2){
        staffPersonal2.setIdcardNum(staffPersonal.getIdcardNum());
        ModelAndView modelAndView = new ModelAndView();
        int resultCode = userService.registUser(staffPersonal2);
        if(resultCode!=0){
            modelAndView.setViewName("register_success");
        }else {
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }
    @RequestMapping("/registForWork")
    public ModelAndView registForWork(@Valid StaffWork staffWork2){
        staffWork2.setPassword(userService.getMD5String("123456"));
        staffWork2.setPhoto(personals.get(0).getPhoto());
        int resultCode = userService.registWoker(staffWork2);
        if(resultCode!=0){
            personals.remove(0);
            if(personals.size()!=0){
                modelAndView.addObject("staffpersonal",personals.get(0));
            }else{
                StaffPersonal staffPersonal = new StaffPersonal();
                staffPersonal.setName("");
                staffPersonal.setSex("");
                staffPersonal.setPhoto("");
                personals.add(new StaffPersonal());
                modelAndView.addObject("staffpersonal",personals.get(0));
            }
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/deskchange")
    public ModelAndView changeWorkDesk(@Valid DeskChange deskChange1){
        deskChange1.setWorkId(staffWork.getWorkId());
        int resultCode = userService.deskChangeApply(deskChange1);
        deskChange = userService.getDeskChangeList(staffWork.getWorkId());
        modelAndView.addObject("deskChangelist",deskChange);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/resign")
    public ModelAndView resign(@Valid Resign resig){
        resig.setWorkId(staffWork.getWorkId());
        resig.setName(staffWork.getName());
        int resultCode = userService.resignApply(resig);
        resigns = userService.getResignList(staffWork.getWorkId());
        modelAndView.addObject("resignlist",resigns);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/appeal")
    public ModelAndView appeal(@Valid Appeal appeal){
        appeal.setWorkId(staffWork.getWorkId());
        appeal.setName(staffWork.getName());
        int resultCode = userService.attendanceAppeal(appeal);
        appeals = userService.getAppealList(staffWork.getWorkId());
        modelAndView.addObject("appealList",appeals);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/shownotice")
    public ModelAndView showContent(int id){
        flag = "showcontent";
        Notice content = userService.getNoticeContent(id);
        modelAndView.addObject("notice",content);
        modelAndView.addObject("flag",flag);
        modelAndView.setViewName("main");
        return modelAndView;
    }
    @RequestMapping("/showprocess")
    public ModelAndView showProcessContent(int id){
        flag = "showprocesscontent";
//        Notice content = userService.getNoticeContent(id);
//        modelAndView.addObject("notice",content);
        modelAndView.addObject("flag",flag);
        modelAndView.setViewName("main");
        return modelAndView;
    }
    @RequestMapping("/passwordchange")
    public ModelAndView changePassword(@RequestParam("passwordNow") String passwordOld, @RequestParam("passwordNew")String passwordNew){
        int resultCode = userService.updateStaffWorkPassword(staffWork.getWorkId(),passwordNew);
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/showfiles")
    public ModelAndView shoeFiles(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:http://localhost:8888");
        return modelAndView;
    }
    @RequestMapping("/qingjia")
    public ModelAndView offworkapply(@Valid OffWork offWork){
        offWork.setWorkId(staffWork.getWorkId());
        offWork.setName(staffWork.getName());
        int resultCode = 0;
        if(resultCode!=0){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }
    @RequestMapping("/change")
    public ModelAndView changebackground(String change){
        flag = change;
        modelAndView.addObject("flag",flag);
        return modelAndView;
    }
    @RequestMapping("/adminchange")
    public ModelAndView changebackgroundForAdmin(String change){
        flag = change;
        adminView.addObject("flag",flag);
        return adminView;
    }

    @RequestMapping("/desk")
    public ModelAndView deskChangeApply(int id ,String applyresult){

        int resultCode = 0;
        resultCode = userService.doDeskChange(applyresult,id);
        if(resultCode!=0){
            for(int i = 0 ;i<deskChange2.size();i++){
                if(deskChange2.get(i).getId()==id){
                    deskChange2.remove(i);
                    break;
                }
            }
            modelAndView.addObject("deskChangelist2",deskChange2);
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }

    @RequestMapping("/resignApply")
    public ModelAndView resignApply(String workId ,String applyresult){

        int resultCode = 0;
        resultCode = userService.doResign(applyresult,workId);
        if(resultCode!=0){
            for(int i = 0 ;i<resigns2.size();i++){
                if(resigns2.get(i).getWorkId().equals(workId)){
                    resigns2.remove(i);
                    break;
                }
            }
            modelAndView.addObject("resignlist2",resigns2);
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }

    @RequestMapping("/workday")
    public ModelAndView workdayapply(int id ,String applyresult){

        int resultCode = 0;
        resultCode = userService.doWorkday(applyresult,id);
        if(resultCode!=0){
            for(int i = 0 ;i<appeals2.size();i++){
                if(appeals2.get(i).getId()==id){
                    appeals2.remove(i);
                    break;
                }
            }
            modelAndView.addObject("appealList2",appeals2);
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("main");
        }
        return modelAndView;
    }

}
