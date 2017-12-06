package com.sgnbs.cms.constants;

/**
 * @Desc 使用枚举类型标示常量数据字典
 */
public enum StateConstantEnum {
    SUCCESS(1, "成功"),
    END(0, "结束"),
    REPEAT(-1, "重复"),
    INNER_ERROR(-2, "系统异常"),
    DATE_REWRITE(-3, "数据篡改")
    ;
    private int state;

    private String stateInfo;

    StateConstantEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public static StateConstantEnum stateOf(int index){
        for (StateConstantEnum stateConstant : values()){
            if(stateConstant.getState() == index){
                return stateConstant;
            }
        }
        return null;
    }
}
