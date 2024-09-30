<%@ page title="" language="C#" masterpagefile="~/Site2.Master" autoeventwireup="true" codebehind="newProject.aspx.cs" inherits="NewMellat.pages.project.newProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
     <%-- <link rel="stylesheet" href="../assets/css/bootstrap.css" />--%>
    <div class="container" dir="rtl">
        <nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-main-tab" data-toggle="tab" href="#nav-main" role="tab" aria-controls="nav-main" aria-selected="true">عملیات پروژه</a>
    <a class="nav-item nav-link" id="nav-team-tab" data-toggle="tab" href="#nav-team" role="tab" aria-controls="nav-team" aria-selected="false">تیم پروژه </a>
    <a class="nav-item nav-link" id="nav-doc-tab" data-toggle="tab" href="#nav-doc" role="tab" aria-controls="nav-doc" aria-selected="false">تاییده سند</a>
    <a class="nav-item nav-link" id="nav-detail1-tab" data-toggle="tab" href="#nav-detail1" role="tab" aria-controls="nav-detail1" aria-selected="false">جزئیات طرح</a>
    <a class="nav-item nav-link" id="nav-detail2-tab" data-toggle="tab" href="#nav-detail2" role="tab" aria-controls="nav-detail2" aria-selected="false">جرئیات درخواست</a>
        <a class="nav-item nav-link" id="nav-corr-tab" data-toggle="tab" href="#nav-corr" role="tab" aria-controls="nav-corr" aria-selected="false">همپوشانی</a>
        <a class="nav-item nav-link" id="nav-benefit-tab" data-toggle="tab" href="#nav-benefit" role="tab" aria-controls="nav-benefit" aria-selected="false">عواید</a>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-main" role="tabpanel" aria-labelledby="nav-main-tab">
        <div class="row">
             <div class="col">
                 <div class="form-group">
                    <label for="title">عنوان پروژه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
        <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">نوع درخواست</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">واحد درخواست کننده</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">ناظر فنی</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">نوع پروژه</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">نوع سند</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">شرکت پیمانکار</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">اولویت</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">سرویس مرتبط</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>           
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">شناسه نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                 </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title"> شماره نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                       </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">تاریخ نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
  </div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
</div>



         <div class="row">
             <div class="col">
                 <div class="form-group">
                    <label for="title">عنوان پروژه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
        <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">نوع درخواست</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">واحد درخواست کننده</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">ناظر فنی</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">نوع پروژه</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">نوع سند</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">شرکت پیمانکار</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">اولویت</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">سرویس مرتبط</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>           
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">شناسه نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                 </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title"> شماره نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                       </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">تاریخ نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
        <hr class="my-hr"/>
        <div class="row"> 
            <div class="col-12">
                 <div class="panel-group">
                     <div class="panel panel-default">
                         <div class="panel-heading">تیم پروژه</div>
                         <div class="panel-body">
                             <table>
              <thead>
              <tr>
                  <td>نقش</td><td>نام و نام خانوادگی</td><td>واحد</td><td>تلفن</td><td>ایمیل</td>
              </tr>
                  </thead>
              <tbody>
                  <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                  </tr>
              </tbody>
          </table>
                         </div>
                     </div>
                </div>
            </div>
        </div>
       
          <hr class="my-hr"/>
        <div class="row"> 
            <div class="col-12">
                 <div class="panel-group">
                     <div class="panel panel-default">
                         <div class="panel-heading">تاییده سند</div>
                         <div class="panel-body">
                             <table>
              <thead>
              <tr>
                  <td>نقش</td><td>نام و نام خانوادگی</td><td>سمت</td><td>تاریخ</td>
              </tr>
                  </thead>
              <tbody>
                  <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                     
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                 
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                    
                  </tr>
              </tbody>
          </table>
                         </div>
                     </div>
                </div>
            </div>
        </div>

           <hr class="my-hr"/>
        <div class="row"> 
            <div class="col-12">
                 <div class="panel-group">
                     <div class="panel panel-default">
                         <div class="panel-heading">جزئیات طرح</div>
                         <div class="panel-body">
                            <div class="row"> 
                                 <div class="col-12">
                                     <div class="form-group">
                    <label for="title">عنوان پروژه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                </div>
                </div>
            </div>
 </div>
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder11" runat="server">
     <%-- <link rel="stylesheet" href="../assets/css/bootstrap.css" />--%>
    <div class="container">
         <div class="row">
             <div class="col">
                 <div class="form-group">
                    <label for="title">عنوان پروژه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
        <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">نوع درخواست</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">واحد درخواست کننده</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">ناظر فنی</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">نوع پروژه</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">نوع سند</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">شرکت پیمانکار</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">اولویت</label>
                    <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">سرویس مرتبط</label>
                    <select> 
                       <option value="1">واحد 1</option>
                       <option value="2">واحد 2</option>
                       <option value="3">واحد 3</option>
                       <option value="4">واحد 4</option>
                       <option value="5">واحد 5</option>
                       <option value="6">واحد 6</option>
                   </select>
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>           
        </div>
         <div class="row">
             <div class="col-4">
                 <div class="form-group">
                    <label for="title">شناسه نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                 </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title"> شماره نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                       </div>
             <div class="col-4">
                  <div class="form-group">
                    <label for="title">تاریخ نامه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
             </div>
        </div>
        <hr class="my-hr"/>
        <div class="row"> 
            <div class="col-12">
                 <div class="panel-group">
                     <div class="panel panel-default">
                         <div class="panel-heading">تیم پروژه</div>
                         <div class="panel-body">
                             <table>
              <thead>
              <tr>
                  <td>نقش</td><td>نام و نام خانوادگی</td><td>واحد</td><td>تلفن</td><td>ایمیل</td>
              </tr>
                  </thead>
              <tbody>
                  <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                  </tr>
              </tbody>
          </table>
                         </div>
                     </div>
                </div>
            </div>
        </div>
       
          <hr class="my-hr"/>
        <div class="row"> 
            <div class="col-12">
                 <div class="panel-group">
                     <div class="panel panel-default">
                         <div class="panel-heading">تاییده سند</div>
                         <div class="panel-body">
                             <table>
              <thead>
              <tr>
                  <td>نقش</td><td>نام و نام خانوادگی</td><td>سمت</td><td>تاریخ</td>
              </tr>
                  </thead>
              <tbody>
                  <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                     
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                 
                  </tr>
                      <tr>
 <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                      <td> <select> 
                       <option value="1">تولید محصول جدید</option>
                       <option value="2">تغییر / بهبود (توسعه نرم افزار )</option>
                       <option value="3">تولید3</option>
                       <option value="4">تولید4</option>
                       <option value="5">تولید5</option>
                       <option value="6">تولید6</option>
                   </select></td>
                      <td> <input type="text" class="form-control" id="exampleInputEmail1" /></td>
                    
                  </tr>
              </tbody>
          </table>
                         </div>
                     </div>
                </div>
            </div>
        </div>

           <hr class="my-hr"/>
        <div class="row"> 
            <div class="col-12">
                 <div class="panel-group">
                     <div class="panel panel-default">
                         <div class="panel-heading">جزئیات طرح</div>
                         <div class="panel-body">
                            <div class="row"> 
                                 <div class="col-12">
                                     <div class="form-group">
                    <label for="title">عنوان پروژه</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" />
                 <%-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                </div>
                </div>
            </div>
 </div>
</asp:content>
