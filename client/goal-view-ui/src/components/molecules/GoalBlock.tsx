import React, {FunctionComponent} from 'react';
import {VSCodeButton} from '@vscode/webview-ui-toolkit/react';
import {VscChevronDown} from 'react-icons/vsc';

import HypothesesBlock from './HypothesesBlock';
import Goal from '../atoms/Goal';
import Separator from '../atoms/Separator';

import classes from './GoalBlock.module.css';
import { PpString } from '../../types';

type GoalBlockProps = {
    goal: {
        id: string, 
        goal: PpString, 
        hypotheses: PpString[]
    }
};

const goalBlock: FunctionComponent<GoalBlockProps> = (props) => {
    
    const {goal} = props;

    return (
        <div className={classes.Block}>
            <HypothesesBlock hypotheses={goal.hypotheses}/>
            <Goal goal={goal.goal}/>
        </div>
    );
};

export default goalBlock;