package com.ruoyi.fb.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * user对象 fb_user
 * 
 * @author chen
 * @date 2023-11-11
 */
public class User extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 用户名邮箱 */
    @Excel(name = "用户名邮箱")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 盐值 */
    @Excel(name = "盐值")
    private Long salt;

    /** 余额 */
    @Excel(name = "余额")
    private Long balance;

    /** 删除标识（0：未删除1：已删除） */
    @Excel(name = "删除标识", readConverterExp = "0=：未删除1：已删除")
    private Long deleted;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setSalt(Long salt) 
    {
        this.salt = salt;
    }

    public Long getSalt() 
    {
        return salt;
    }
    public void setBalance(Long balance) 
    {
        this.balance = balance;
    }

    public Long getBalance() 
    {
        return balance;
    }
    public void setDeleted(Long deleted) 
    {
        this.deleted = deleted;
    }

    public Long getDeleted() 
    {
        return deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("salt", getSalt())
            .append("balance", getBalance())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
