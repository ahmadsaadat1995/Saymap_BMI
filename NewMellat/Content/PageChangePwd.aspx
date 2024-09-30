<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PageChangePwd.aspx.cs" Inherits="NewMellat.Content.PageChangePwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="box box-danger" style="padding: 6px">
        <asp:ChangePassword ID="ChangePassword1" runat="server" CancelButtonText="انصراف" ChangePasswordButtonText="تغییر رمز عبور" ChangePasswordTitleText="تغییر رمز عبور" ConfirmNewPasswordLabelText="تکرار رمز عبور جدید" ConfirmPasswordCompareErrorMessage="رمز عبور جدید باید با تکرار برابر باشد" ConfirmPasswordRequiredErrorMessage="رمز جدید مورد نیاز است" ContinueButtonText="ادامه" NewPasswordLabelText="رمز عبور جدید" NewPasswordRegularExpressionErrorMessage="لطفا رمز دیگری را وارد نمایید" NewPasswordRequiredErrorMessage="رمز جدید مورد نیاز است" PasswordLabelText="رمز عبور" PasswordRequiredErrorMessage="رمز مورد نیاز است" SuccessText="رمز شما با موفقیت تغییر یافت" SuccessTitleText="تغییر رمز با موفقیت انجام شد" UserNameLabelText="نام کاربری" UserNameRequiredErrorMessage="نام کاربری مورد نیاز است" ContinueDestinationPageUrl="~/Content/PageChangePwd.aspx">
        </asp:ChangePassword>
    </div>
    <div>
    </div>
</asp:Content>
